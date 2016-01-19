require 'rails_helper'

feature 'Creating Items' do
  let(:item_attributes) { attributes_for :item }
  it "creates an item" do
    visit root_path
    click_on "Items"
    click_on "Add Item"
    fill_in "Name", with: item_attributes[:name]

    click_on "Create Item"
    expect(page).to have_content "Created #{item_attributes[:name]} successfully"
  end

  it "does not create an item without a name" do
    visit root_path

    click_on "Items"
    click_on "Add Item"
    click_on "Create Item"

    expect(page).to have_content "Name can't be blank"
  end
end
