# frozen_string_literal: true

require 'watir'
require 'yaml'
require 'selenium-webdriver'
require 'rspec/expectations'
require './features/pages/login_page.rb'
require './features/pages/architect_home_page.rb'
require './features/pages/routes.rb'

config = YAML.load_file('./features/support/config.yml')

Given('user is logged in') do
  @login = LoginPage.new(@browser)
  @browser.goto('https://@login.stage.transloc.com/login/?next=https://architect.stage.transloc.com/')
  @browser.wait_until { |b| b.title == 'Log in' }
  @login.enter_username config['valid_username']
  @login.enter_password config['valid_password']
  @login.click_login_button
  expect(@login.title?).to eq('Architect')
end

When('the user clicks on the NEW FEED button') do
  @architect_home_page = ArchitectHomePage.new(@browser)
  @browser.wait_until { |b| b.title == 'Architect' }
  @architect_home_page.click_new_feed_button
end

When('the user fills in the required fields') do
  @architect_home_page.enter_feed_name('feedname')
  @architect_home_page.enter_publisher_name('pub name')
  @architect_home_page.enter_publisher_url('http://www.example.com')
  @architect_home_page.enter_language('en')
  @architect_home_page.click_agency_info_tab
  @architect_home_page.enter_agency_info_url('http://www.transloc.com')
end

When('clicks save') do
  @architect_home_page.click_save
end

Then('the feed dashboard displays 6 options') do
  @browser.wait_until { |b| b.a(data_id: 'routes').exists? }
  expect(@browser.a(data_id: 'routes').exists?).to eq(true)
  expect(@browser.a(data_id: 'stops').exists?).to eq(true)
  expect(@browser.a(data_id: 'patterns').exists?).to eq(true)
  expect(@browser.a(data_id: 'calendars').exists?).to eq(true)
  expect(@browser.a(data_id: 'trips').exists?).to eq(true)
  expect(@browser.a(data_id: 'blocks').exists?).to eq(true)
end

When('the user goes back to the Architect home Page') do
  @architect_home_page.click_all_feeds
end

When('user clicks on the New Feed name button') do
  @browser.a(text: 'feedname').click
end

When("the user creates a new feed named {string}") do |string|
  @architect_home_page = ArchitectHomePage.new(@browser)
  @architect_home_page.click_new_feed_button
  @architect_home_page.enter_feed_name(string)
  @architect_home_page.enter_publisher_name('pub name ' + string)
  @architect_home_page.enter_publisher_url('http://www.example.com/' + string)
  @architect_home_page.enter_language('en')
  @architect_home_page.click_agency_info_tab
  @architect_home_page.enter_agency_info_url('http://www.transloc.com/' + string)
  @architect_home_page.click_save
end

Then("the Feed Column should be populated with {string}") do |string|
  @browser.wait_until { |b| b.a(title: 'New Feed').exists? }
  expect(@browser.a(text: string).exists?).to eq(true)
end

When("the user creates a new route named {string}") do |string|
  # @browser.wait_until { |b| b.a(data_id: 'routes').exists? }
  @routes = RoutesPage.new(@browser)
  @routes.click_routes_option
  @routes.click_new_route
  @routes.enter_long_name(string)
  @routes.enter_short_name(string)
  @routes.enter_bg_color('008844')
  @routes.enter_text_color('FFFFFF')
  @routes.click_save
end

When("navigates back to the routes page") do
  @routes.back_to_routes_main_page
end

Then("the {string} Route is created") do |string|
  @routes.does_this_route_exist?(string)
end

When('the user navigates back to the {string} main page') do |string|
  @routes.back_to_feed_dashboard(string)
end

When("the user creates a stop named {string} with cordinates {float} and {float}") do |string, float, float2|
  @stops = StopsPage.new(@browser)
  @stops.click_stop_option
  @stops.click_new_stop
  @stops.enter_stop_name(string)
  @stops.latitude(float)
  @stops.longitude(float2)
  @stops.back_to_stops_main_page
  @stops.does_this_stop_exist?(stop_name)
end
