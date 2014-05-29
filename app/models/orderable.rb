class Orderable
  include ActiveModel
  def initialize (id, qty)
    @id = id
    @qty = qty
  end
  attr_accessor :id
  attr_accessor :qty

  def inspect
    "#{name}:#{qty}"
  end

  def name
    produceable.name
  end

  def produceable
    @produceable ||= Produceable.find(id)
  end

  alias_method :product, :produceable
  alias_method :component, :produceable

  def cost
    @cost ||= produceable.cost != 0 && qty ? (produceable.cost * qty) : (value * qty)
  end

  def value
    @value ||= produceable.value != 0 && qty ? (produceable.value * qty) : 0
  end

  def item_id
    @item_id ||= id
  end

  def sub_components
    @sub_components ||= produceable.produceable_components
  end
end
