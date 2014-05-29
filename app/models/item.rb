class Item < ActiveRecord::Base
  def self.to_orderables_collection
    OrderablesCollection.new *all
  end
end
