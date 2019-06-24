# frozen_string_literal: true

require 'watir'
require 'yaml'
require 'selenium-webdriver'
require 'rspec/expectations'
require './features/pages/login_page.rb'
require './features/pages/architect_home_page.rb'

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

Then('the Feed Column should be populated with the New Feed name') do
  @browser.wait_until { |b| b.a(title: 'New Feed').exists? }
  expect(@browser.a(text: 'feedname').exists?).to eq(true)
end

When('user clicks on the New Feed name button') do
  @browser.a(text: 'feedname').click
end
