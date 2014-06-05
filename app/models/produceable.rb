class Produceable < ActiveRecord::Base
  has_many :produceable_components, foreign_key: :product_id
  has_many :components, through: :produceable_components

  @@costs = Hash.new

  def cost
    return @cost unless @cost.nil?
    if calculated_cost != 0
      @cost = calculated_cost + (blueprint_cost || 0)
    else
      @cost = value
    end
  end

  def has_components?
    @has_comments ||= produceable_components.count > 0
  end

  def is_buildable?
    has_components?
  end

  def item_id
    id
  end

  def self.cost(id)
    @@costs[id] ||= self.find(id).cost
  end

  private

  def calculated_cost
    @cost ||= components.map(&:cost).reduce(0, &:+)
  end

end
