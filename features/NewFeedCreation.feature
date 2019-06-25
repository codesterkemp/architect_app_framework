Feature: New Feed Creation
Ensure that the user can create New Feeds
Background: User on the Architect Home Page
Given user is logged in
	Scenario: New Feed Creation 
		When the user creates a new feed named "Test 1 New Feed"
		Then the feed dashboard displays 6 options
		When the user goes back to the Architect home Page
		Then the Feed Column should be populated with "Test 1 New Feed"
		When user clicks on the New Feed name button
		Then the feed dashboard displays 6 options

