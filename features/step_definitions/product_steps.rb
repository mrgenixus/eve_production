Given(/^I visit the Add Product Component page$/) do
	visit new_product_path
end

Then(/^I should see the heading '(.+)'$/) do | heading |
  page.within 'h1' do
  	page.should have_content heading
  end
end

Then(/^The submit button should be labeled "(.+)"$/) do |label|
  page.find("input[type=\"submit\"]").value.should eq label
end

When(/^I click '(.+)'$/) do | label |
  page.find("input[type=\"submit\"][value=\"#{label}\"]").click

end

Then(/^A notice that reads 'Invalid Name' is displayed$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter a name$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^A list of 'Products' will be displayed in a table$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the product will show 'Astroid Refined' in the 'Source' column$/) do
  pending # express the regexp above with the code you wish you had
end