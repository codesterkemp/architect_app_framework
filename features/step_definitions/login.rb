# frozen_string_literal: true

require 'watir'
require 'selenium-webdriver'
require 'rspec/expectations'
require './features/support/env.rb'
require './features/pages/login_page.rb'

Given('user is on the login page') do
  @login = LoginPage.new(@browser)
  @browser.goto('https://@login.stage.transloc.com/login/?next=https://architect.stage.transloc.com/')
  @browser.wait_until { |b| b.title == 'Log in' }
end

When('the user login with valid credentials') do
  @login.enter_username 'valid_username'
  @login.enter_password 'valid_password'
  @login.click_login_button
end

Then('the Architect home screen is displayed to the user') do
  expect(@login.title?).to eq('Architect')
end

When('he user login with invalid credentials') do
  @login.enter_username 'bad_qa_user_1'
  @login.enter_password 'garbage_password'
  @login.click_login_button
end

Then('the login page is displayed with an error message') do
  expect(@login.title?).to eq('Log in')
  expect(@login.warning_message_displayed?).to eq(true)
end
