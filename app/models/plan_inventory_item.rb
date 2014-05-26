class PlanInventoryItem < Item
  belongs_to :component, foreign_key: :item_id, class_name: "Produceable"
  belongs_to :build_plan

  def self.get_orderables
    preload(:component).map do |plan_inventory_item|
      Orderable.new plan_inventory_item.component.id, plan_inventory_item.qty
    end.group_by(&:id).map do |id, orderables|
      Orderable.new id, orderables.map(&:qty).reduce(&:+)
    end
  end

  def cost
    cost = component.try(:cost)
    if cost && cost == 0
      cost = component.try(:value)
    end

    (qty || 1) * (cost || 0)
  end

  def value
    ((component.value || component.cost) * qty || 1)
  end
end
