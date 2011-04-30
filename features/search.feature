Feature: As a user, I want search google for phrase Hello World

	Scenario: Return Search Results for a term
		Given I am on the Google Homepage
		When I enter a "Hello World"
		Then First result of search should contain "Hello World"