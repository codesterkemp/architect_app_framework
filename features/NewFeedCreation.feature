Feature: New Feed Creation
Ensure that the user can create New Feeds
Background: User on the Architect Home Page
Given user is logged in
	Scenario: New Feed Creation 
		When the user clicks on the NEW FEED button
		And the user fills in the required fields
		And clicks save
		Then the feed dashboard displays 6 options
		When the user goes back to the Architect home Page
		Then the Feed Column should be populated with "Test 1 New Feed"
		When user clicks on the New Feed name button
		Then the feed dashboard displays 6 options
	Scenario: New Feed Creation 
		When the user creates a new feed named "Test 1 New Feed"
		Then the feed dashboard displays 6 options
		When the user goes back to the Architect home Page
		Then the Feed Column should be populated with "Test 1 New Feed"
		When user clicks on the New Feed name button
		Then the feed dashboard displays 6 options
@dev		
	Scenario: End to End Feed Creation
		When the user creates a new feed named "Test 2 New Feed"
		Then the feed dashboard displays 6 options
		When the user creates a new route named "first"
		And navigates back to the routes page
		Then the "first" Route is created
		When the user navigates back to the "Test 2 New Feed" main page
		And the user creates a stop named "Pullen Park" with cordinates 35.77886077159881 and -78.66260290145874
		And the user creates a stop named "Dorthea Dix Fields" with cordinates 35.76732947004767 and -78.66379380226135
		And the user creates a stop named "Greenway Trail Head" with cordinates 35.7711510259684 and -78.653279542923
