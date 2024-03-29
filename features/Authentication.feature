Feature: Authentication
Login page to the Architect page should only accept valid credentials. 
Background: Login Page
Given user is on the login page
	Scenario: Login with good credentials 
		When the user login with valid credentials
		Then the Architect home screen is displayed to the user

  Scenario: Login with bad credentials 
		When the user login with invalid credentials
		Then the login page is displayed with an error message

	Scenario: Reset credentials
		When the user clicks on the forgot password link
		Then the Forgot Password page is displayed