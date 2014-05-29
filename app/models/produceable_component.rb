class ProduceableComponent < ActiveRecord::Base
  belongs_to :product, foreign_key: :product_id, class_name: "Produceable"
  belongs_to :component, foreign_key: :component_id, class_name: "Produceable"

  def cost
    @cost ||= (component.try(:cost) || 0) * (qty || 0)
  end

  def value
    @value ||= (component.try(:value) || 0) * (qty || 0)
  end

  def item_id
    @item_id ||= component_id
  end
end
