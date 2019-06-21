# frozen_string_literal: true

require 'watir'
require 'yaml'
require 'selenium-webdriver'
require 'rspec/expectations'
require './features/pages/login_page.rb'

config = YAML.load_file('./features/support/config.yml')

Given('user is on the login page') do
  @login = LoginPage.new(@browser)
  @browser.goto('https://@login.stage.transloc.com/login/?next=https://architect.stage.transloc.com/')
  @browser.wait_until { |b| b.title == 'Log in' }
end

When('the user login with valid credentials') do
  @login.enter_username config['valid_username']
  @login.enter_password config['valid_password']
  @login.click_login_button
end

Then('the Architect home screen is displayed to the user') do
  expect(@login.title?).to eq('Architect')
end

When('the user login with invalid credentials') do
  @login.enter_username ['invalid_username']
  @login.enter_password config['invalid_password']
  @login.click_login_button
end

Then('the login page is displayed with an error message') do
  expect(@login.title?).to eq('Log in')
  expect(@login.warning_message_displayed?).to eq(true)
end

When('the user clicks on the forgot password link') do
  @login.click_forgot_password
end

Then('the Forgot Password page is displayed') do
  expect(@login.title?).to eq('Forgot Password')
end
