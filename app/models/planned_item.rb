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
    preload(:product).map do |plan_inventory_item|
      Orderable.new plan_inventory_item.product.id, plan_inventory_item.qty
    end.group_by(&:id).map do |id, orderables|
      Orderable.new id, orderables.map(&:qty).reduce(&:+)
    end
  end

  def cost
    (product.cost * qty || 1)
  end

  def value
    (product.value * qty || 1)
  end
end
