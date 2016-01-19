require 'rails_helper'

describe 'Viewing items' do
  let!(:items) { create_list :item, 3 }
  let(:item) { items.sample }
  it "lists items" do
    visit items_path

    items.each do |item|
      expect(page).to have_link item.name, href: polymorphic_path(item)
    end
  end

  it "shows an item's details" do
    visit items_path

    click_on item.name

    expect(page).to have_content "Name #{item.name}"
  end
end
