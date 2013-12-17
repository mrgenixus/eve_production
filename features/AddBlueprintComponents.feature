Feature: As a user I want to add my blueprints' components
	
	as an Example:

	Scenario: A User converts a product to a blueprint
		Given I visit the Edit Product page
		When I select "Blueprint" as "Source"
		When I click "Save Product"
		When I visit the Edit Product Page
		Then the Product I have modified should be a blueprint

	Scenario: A User edits a Blueprint to add Components
		Given I visit the Edit Blueprint page
		When I click the "Add Component" link
		Then I can select the component I want to add
		Then I can set the quantity of the component I want to add

	Scenario: A User adds a Component to a Blueprint
		Given I visit the Edit Blueprint page
		When I click the "Add Component" link
		When I select the component I want to add
		When I set the quantity of the component I want to add
		When I click "Save Blueprint"
		Then I see a list of "Compontents"
		Then I see an "Add Component" link

