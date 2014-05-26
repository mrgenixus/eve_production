class BuildPlan < ActiveRecord::Base
  has_many :plan_inventory_items
  has_many :planned_items

  def purchase_order
    planned_orderables = planned_items.get_orderables
    inventoried_orderables = plan_inventory_items.get_orderables + planned_items.get_buildables

    inventoried_orderables = inventoried_orderables.group_by(&:id).map do |id, orderables|
      Orderable.new id, orderables.map(&:qty).reduce(0, &:+)
    end.group_by(&:id)

    planned_orderables.map do |orderable|
      Orderable.new orderable.id, orderable.qty - (inventoried_orderables[orderable.id].try(:first).try(:qty) || 0)
    end.reject do |orderable|
      orderable.qty == 0
    end
  end

  def cost
    planned_items.map(&:cost).reduce(0, &:+) - plan_inventory_items.map(&:cost).reduce(0, &:+)
  end

  def value
    planned_items.map(&:value).reduce(0, &:+) - plan_inventory_items.map(&:value).reduce(0, &:+)
  end
end
