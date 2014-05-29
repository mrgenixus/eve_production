class PlannedItem < Item
  belongs_to :product, foreign_key: :item_id, class_name: "Produceable"
  belongs_to :build_plan

  validates :product, presence: true
  validates :build_plan, presence: true

  def cost
    @cost ||= ((product.try(:cost) || 0 ) * (qty || 1))
  end

  def value
    @value ||= ((product.try(:value) || 0) * (qty || 1))
  end

  def self.cost
    to_orderables_collection.cost
  end

  def self.value
    to_orderables_collection.value
  end

  def self.sub_components
    to_orderables_collection.sub_components
  end
end
