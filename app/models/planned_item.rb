class PlannedItem < Item
  belongs_to :product, foreign_key: :item_id, class_name: "Produceable"
  belongs_to :build_plan

  validates :product, presence: true
  validates :build_plan, presence: true

  def self.get_orderables
    preload(:product).flat_map do |planned_item|
      planned_item.product.purchase_report.map do |orderable|
        Orderable.new orderable.id, orderable.qty * (planned_item.qty || 1)
      end
    end.group_by(&:id).map do |id, orderables|
      Orderable.new id, orderables.map(&:qty).reduce(&:+)
    end
  end

  def self.get_buildables
    preload(:product).map do |planned_item|
      Orderable.new planned_item.product.id, planned_item.qty
    end.group_by(&:id).map do |id, orderables|
      Orderable.new id, orderables.map(&:qty).reduce(&:+)
    end
  end

  def cost
    ((product.try(:cost) || 0 ) *( qty || 1))
  end

  def value
    ((product.try(:value) || 0) * (qty || 1))
  end
end
