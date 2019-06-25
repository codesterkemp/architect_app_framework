# frozen_string_literal: true

require 'watir'

class StopsPage
  def initialize(browser)
    @browser = browser
  end

  def click_stop_option
    @browser.wait_until { |b| b.a(data_id: 'routes').exists? }
    @browser.a(data_id: 'stops').click
  end

  def click_logout_button
    @browser.link(text: 'logout').click
  end

  def click_new_stop
    @browser.a(data_id: 'new-button').click
  end

  def enter_stop_name(string)
    sleep 1
    @browser.wait_until { |b| b.text_field(name: 'field-name').exists? }
    @browser.text_field(name: 'field-name').send_keys(string)
  end

  def enter_latitude(string)
    @browser.text_field(name: 'position.latitude').send_keys(string)
  end

  def enter_longitude(string)
    @browser.text_field(name: 'position.longitude').send_keys(string)
  end

  def click_save
    @browser.button(data_id: 'save-button').click
  end

  def check_for_dashboard_options?
    @browser.a(data_id: 'routes').exists? &&
      @browser.a(data_id: 'stops').exists? &&
      @browser.a(data_id: 'patterns').exists? &&
      @browser.a(data_id: 'calendars').exists? &&
      @browser.a(data_id: 'trips').exists? &&
      @browser.a(data_id: 'blocks').exists?
  end

  def back_to_stops_main_page
    @browser.wait_until { |b| b.button(data_id: 'delete-button').exists? }
    @browser.a(text: 'stops').click
  end

  def does_this_stop_exist?(stop_name)
    @browser.wait_until { |b| b.a(data_id: 'new-button') }
    @browser.a(text: stop_name).exists?
  end

  def click_all_feeds
    @browser.a(text: 'All Feeds').click
  end

  def back_to_feed_dashboard(feed_name)
    @browser.a(title: feed_name).click
  end

  def title?
    @browser.title
  end
end
