Feature: A Product Component has a name and a source.

	Sources include: 
	-    Moon Tier 1
	-    Moon Tier 2
	-    Moon Tier 3
	-    Moon Tier 4
	-    Planet Tier 1
	-    Planet Tier 2
	-    Planet Tier 3
	-    Planet Tier 4
	-    Asteroid Unrefined
	-    Asteroid Refined
	-    Gas Tier 1
	-    Gas Refined
	-    Blueprint

	If a User doesn't enter a name, the Conponent isn't valid
	If a User doesn't select a name, the Component should be an Asteroid Refined sourced item.

	Background: 
		Given I visit the Add Product page

	Scenario: There should be an "Add Product" page
		Then I should see the heading "Add Product"

	Scenario: The submit button should be correctly labled
		Then The submit button should be labeled "Create Product"

	Scenario: A User enters valid product information
		When I enter a name
		When I select a source
		When I click "Create Product"
		Then A notice that reads "Product Created" is displayed
		Then A list of "Products" will be displayed in a table
		Then the product will show the enterred source in the "Source" column

	Scenario: A User doesn't enter a name
		When The submit button should be labeled "Create Product"
		When I click "Create Product"
		Then An error that reads "Invalid Product (name)" is displayed

	Scenario: A User doesn't select a source
		When I enter a name
		When I click "Create Product"
		Then A notice that reads "Product Created" is displayed
		Then A list of "Products" will be displayed in a table
		Then the product will show "Asteroid Refined" in the "Source" column