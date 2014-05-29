class BuildPlan < ActiveRecord::Base
  has_many :plan_inventory_items
  has_many :planned_items

  # def purchase_order
  #   planned_orderables = planned_items.get_orderables
  #   inventoried_orderables = plan_inventory_items.get_orderables + planned_items.get_buildables

  #   inventoried_orderables = inventoried_orderables.group_by(&:id).map(&method(:make_aggregate_orderable)).group_by(&:id)

  #   planned_orderables.map do |orderable|
  #     Orderable.new orderable.id, orderable.qty - (inventoried_orderables[orderable.id].try(:first).try(:qty) || 0)
  #   end.reject do |orderable|
  #     orderable.qty == 0
  #   end
  # end

  def cost
    planned_items.to_orderables_collection.reduce_from_inventory(planned_items.sub_components).cost
  end

  def value
    planned_items.to_orderables_collection.reduce_from_inventory(planned_items.sub_components).value
  end

  def purchase_order
    planned_items.to_orderables_collection.sub_components.reduce_from_inventory(inventory).cleanup
  end

  def inventory
    inventory = plan_inventory_items + planned_items
  end
end
