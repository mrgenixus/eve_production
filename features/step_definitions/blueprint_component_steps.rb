Then(/^the Product I have modified should be a blueprint$/) do
  Product.find(@product.id).source.should eq :blueprint
end

When(/^I click the "(.*?)" link$/) do |arg1|
  page.click_link arg1
end

Then(/^I can select the component I want to add$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can set the quantity of the component I want to add$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I select the component I want to add$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I set the quantity of the component I want to add$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a list of "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see an "(.*?)" link$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the Add Blueprint Page$/) do
  visit new_blueprint_path
end

Given(/^I visit the Edit Blueprint page$/) do
  @blueprint ||= FactoryGirl.create(:blueprint)
  visit edit_blueprint_path(@blueprint)
end