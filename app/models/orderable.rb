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

  delegate :name, to: :produceable

  def produceable
    Produceable.find(id)
  end

  def cost
    produceable.cost != 0 && qty ? (produceable.cost * qty) : value
  end

  def value
    produceable.value != 0 && qty ? (produceable.value * qty) : 0
  end
end
