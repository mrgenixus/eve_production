class PlanInventoryItem < Item
  belongs_to :component, foreign_key: :item_id, class_name: "Produceable"
  belongs_to :build_plan

  def cost
    (component.try(:cost) || 0) * (qty || 1)
  end

  def value
    (component.try(:value) || 0) * (qty || 1)
  end
end
