# frozen_string_literal: true

require 'watir'

class RoutesPage
  def initialize(browser)
    @browser = browser
  end

  def click_routes_option
    @browser.wait_until { |b| b.a(data_id: 'routes').exists? }
    @browser.a(data_id: 'routes').click
  end

  def click_logout_button
    @browser.link(text: 'logout').click
  end

  def click_new_route
    @browser.wait_until { |b| b.a(data_id: 'new-button').exists? }
    @browser.a(data_id: 'new-button').click
  end

  def enter_long_name(string)
    @browser.text_field(name: 'long_name').send_keys(string)
  end

  def enter_short_name(string)
    @browser.text_field(name: 'short_name').send_keys(string)
  end

  def enter_bg_color(hex_string)
    @browser.text_field(data_id: 'field-color').send_keys(hex_string)
  end

  def enter_text_color(hex_string)
    @browser.text_field(data_id: 'field-text_color').send_keys(hex_string)
  end

  def enter_language(lang)
    @browser.text_field(name: 'language').send_keys(lang)
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

  def back_to_routes_main_page
    @browser.wait_until { |b| b.button(data_id: 'delete-button').exists? }
    @browser.a(text: 'Routes').click
  end

  def does_this_route_exist?(route_name)
    @browser.wait_until { |b| b.a(data_id: 'new-button') }
    @browser.a(text: route_name).exists?
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
