Given(/^I visit the Add Product Component page$/) do
	visit new_product_path
end

Then(/^I should see the heading "(.+)"$/) do | heading |
  page.within 'h1' do
  	page.should have_content heading
  end
end

Then(/^The submit button should be labeled "(.+)"$/) do |label|
  page.find("input[type=\"submit\"]").value.should eq label
end

When(/^I click "(.+)"$/) do | label |
  page.find("input[type=\"submit\"][value=\"#{label}\"]").click

end

Then(/^An? (notice|error) that reads "(.+)" is displayed$/) do | type,msg |
  page.all(".#{type}").count.should be_> 0
  page.all(".#{type}").first.text.should eq msg
end

Then(/^the product will show "(.*?)" in the "(.*?)" column$/) do |value, column_label|
    page.within "table" do

  	source_column = -1
	  name_column = -1
	  product_row = -1
  	
    columns = page.all('th').map { | column | column.text }
    name_column = columns.find_index("Name")
    source_column = columns.find_index(column_label)

    rows = page.all('tr').map do | row |
      these_columns = row.all("td")
      name = these_columns[name_column] if these_columns.count >= name_column - 1
      nil
      name.text if name
    end

    product_row = rows.find_index(@product_row) + 1

    source_column.should_not eq -1
  	product_row.should_not eq -1

  	page.all("tr")[product_row].all("td")[source_column].text.should eq value
    
  end
end

When(/^I select a source$/) do
	@selected_options ||= {}
	@selected_options[:source] = "Asteroid Unrefined"
	page.select @selected_options[:source], :from => :source
end

Then(/^the product will show the enterred source in the "(.*?)" column$/) do |column_label|

  page.within "table" do

  	source_column = -1
	  name_column = -1
	  product_row = -1
  	
    columns = page.all('th').map { | column | column.text }
    name_column = columns.find_index("Name")
    source_column = columns.find_index(column_label)

    rows = page.all('tr').map do | row |
      these_columns = row.all("td")
      name = these_columns[name_column] if these_columns.count >= name_column - 1
      nil
      name.text if name

    end

    product_row = rows.find_index(@product_row) + 1

    source_column.should_not eq -1
  	product_row.should_not eq -1

  	page.all("tr")[product_row].all("td")[source_column].text.should eq @selected_options[:source]
    
  end

end

When(/^I enter a name$/) do
	@product_name = Forgery::LoremIpsum::word
  page.fill_in :name, :with => @product_name
end

Then(/^A list of "(.*?)" will be displayed in a table$/) do |caption|
  page.within "table" do
  	page.within "caption" do
  		page.has_content? caption
  	end
  end
end