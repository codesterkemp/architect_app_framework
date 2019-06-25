Feature: New Feed Creation
Ensure that the user can create New Feeds with end to end workflow.
#This Feature's test case is not completed.
Background: User on the Architect Home Page
Given user is logged in
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