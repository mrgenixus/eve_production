require 'rails_helper'

feature "Delete items" do
  let!(:items) { create_list :item, 3}
  let(:item) { items.sample }
  it "removes an item" do
    visit items_path

    expect do
      within 'tr', text: item.name do
        click_on 'Delete'
      end
    end.to change { Item.count }.by -1

    expect(page).to have_content "Deleted #{item.name} successfully"
  end
end
