Feature: As A User I expect to be able to put a price on Product Components in ISK

	Scenario: I add Isk Value to a Product
		Given I visit the Edit Product Component page
		When I enter a value for the product
		When I click "Save Product"
		Then A notice that reads "Product Saved" is displayed