Feature: Navigation
	As a MonoTouch developer
	I want to have a sample feature file
	So I can see how acceptance testing works with Frank/Cucumber

Scenario: Simple drill down
Given I launch the app
And I wait to see a navigation bar titled "Plays"
When I touch the 3rd table cell
Then I should see a navigation bar titled "Othello"
When I wait for 1 second
And I navigate back
Then I should see a navigation bar titled "Plays"
