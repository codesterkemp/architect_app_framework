# frozen_string_literal: true

require 'watir'
require 'selenium-webdriver'

Before do
  Selenium::WebDriver::Chrome::Service.driver_path = './features/driver/chromedriver'
  @browser = Watir::Browser.new :chrome
end

After do
  @browser.close
end
