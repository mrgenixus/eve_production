Feature: As a User, I expect that there should be a list of Blueprints.
	Blueprints include all of/only the Product Components that are a 'Blueprint'-sourced Component

	Scenario: There should be an Add Blueprint page
		Given I visit the Add Blueprint page
		Then I should see the heading "Add Blueprint"

	Scenario: A User enters valid Blueprint information
		Given I visit the Add Blueprint page
		When I enter a name
		When I click "Create Blueprint"
		Then A notice that reads "Blueprint Created" is displayed
		Then A list of "Blueprints" will be displayed in a table
		Then the entered name should be listed in the table

	Scenario: A User enters invalid Blueprint information
		Given I visit the Add Blueprint page
		When I click "Create Blueprint"
		Then An error that reads "Invalid Blueprint" is displayed
