class Produceable < ActiveRecord::Base
  has_many :produceable_components, foreign_key: :product_id

  def components
    produceable_components.map(&:coponent)
  end

  def cost
    produceable_components.map(&:cost).reduce(0, &:+) + (blueprint_cost || 0)
  end

  def purchase_report
    produceable_components.get_orderables
  end

  def has_components?
    produceable_components.count > 0
  end

  def is_buildable?
    has_components?
  end
end
