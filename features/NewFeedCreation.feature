Feature: New Feed Creation
Ensure that the user can create New Feeds
Background: User on the Architect Home Page
Given user is logged in
	Scenario: New Feed Creation 
		When the user clicks on the NEW FEED button
		And the user fills in the required fields
		Then the feed dashboard displays 6 options
		When the user goes back to the Architect home Page
		Then the Feed Column should be populated with the New Feed name
		When user clicks on the New Feed name button
		Then the feed dashboard displays 6 options
		
