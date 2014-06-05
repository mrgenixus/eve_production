class OrderablesCollection
  include Enumerable

  def initialize(*members)
    @members = members.group_by(&:item_id).map(&method(:aggregate))
  end

  def each(&block)
    @members.each(&block)
  end

  def refine
    OrderablesCollection.new *@members.group_by(&:item_id).map(&method(:aggregate))
  end

  def requantify(qty)
    members = @members.group_by(&:item_id).map do |id, orderables|
      Orderable.new id, orderables.map{|orderable| orderable.qty * qty }.reduce(0, &:+)
    end

    OrderablesCollection.new *members
  end

  def aggregate args
    id, orderables = args
    Orderable.new id, orderables.map(&:qty).compact.reduce(0, &:+)
  end

  def to_a
    @members.clone
  end

  def cost
    final_component_qty.value
  end

  def value
    Produceable.where(id: @members.map(&:item_id)).pluck(:value).reduce(0, &:+)
  end

  def final_component_qty
    OrderablesCollection.new *sub_components.flat_map do |sub_component|
      if sub_component.final_component_qty.count > 0
        sub_component.final_component_qty * sub_component.qty
      else
        [sub_component]
      end
    end
  end

  def reduce_from_inventory(orderables_collection)
    orderables_collection = OrderablesCollection.new *(orderables_collection.to_a)

    members = map do |orderable|
      Orderable.new orderable.item_id, [0, (orderable.qty - orderables_collection.at(orderable.item_id).qty)].max
    end

    OrderablesCollection.new *members
  end

  def at item_id
    unless grouped_members[item_id].nil?
      aggregate([ item_id, grouped_members[item_id]])
    else
      Orderable.new item_id, 0
    end
  end

  def grouped_members
    @grouped_members ||= @members.group_by(&:item_id)
  end

  def cleanup
    members = reject {|m| m.qty == 0}
    OrderablesCollection.new *members
  end

  def sub_components
    members = flat_map do |o|
      o.sub_components * o.qty
    end

    OrderablesCollection.new *members
  end

  def items
    Produceable.where(id: @members.map(&:item_id))
  end
end