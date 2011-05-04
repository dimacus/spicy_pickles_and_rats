Feature: As a user, I want search google for phrase Hello World

	Scenario: Search Google for Hello World and see what comes up
		Given I am on the Google Homepage
		When I enter a "Hello World"
		Then First result of search should contain "Hello World"