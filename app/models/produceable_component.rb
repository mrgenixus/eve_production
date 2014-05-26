class ProduceableComponent < ActiveRecord::Base
  belongs_to :product, foreign_key: :product_id, class_name: "Produceable"
  belongs_to :component, foreign_key: :component_id, class_name: "Produceable"

  def cost
    cost = component.cost
    if cost == 0
      cost = component.value
    end

    (qty || 1) * (cost || 0)
  end

  def value
    value = component.value

    if value == 0
      value = component.cost
    end

    (qty || 1) * (value || 0)
  end

  def self.get_orderables
    preload(:component).group_by(&:component).map do |component, produceable_components|
      Orderable.new component.id, produceable_components.map(&:qty).reduce(&:+)
    end
  end
end
