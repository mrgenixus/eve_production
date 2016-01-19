require 'rails_helper'

describe "Item Functions" do
  def response_json
    JSON.parse(response.body).deep_symbolize_keys
  end

  let!(:items) { create_list :item, 3, price: 1.00 }
  let(:item) { items.sample }

  it "changes the price of an item" do
    expect do
      patch "/items/#{item.id}.js", item: { price: 5.00 }, format: :json
    end.to change { Item.find(item.id).price }

    expect(response_json).to match({item: {id: item.id, name: item.name, price: 5.00 }, success: true })
  end

  it "sets the price of several items" do
    items_hash = items.each_with_index.map do |item, n|
      { id: item.id, price: n + 2 }
    end

    expect do
      patch "/items/", items: items_hash, format: :json
    end.to change { Item.all.any? { |item| item.price == 1} }

    expect(response_json).to match({items: items_hash.map do |item|
      {
        name: Item.find(item[:id]).name,
        id: item[:id],
        price: item[:price]
      }
    end, success: true })
  end
end
