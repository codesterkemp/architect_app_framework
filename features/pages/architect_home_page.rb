# frozen_string_literal: true

require 'watir'

class ArchitectHomePage
  def initialize(browser)
    @browser = browser
  end

  def click_new_feed_button
    @browser.a(title: 'New Feed').click
  end

  def click_logout_button
    @browser.link(text: 'logout').click
  end

  def enter_feed_name(feedname)
    @browser.text_field(name: 'name').send_keys(feedname)
  end

  def enter_publisher_name(publisher)
    @browser.text_field(name: 'publisher_name').send_keys(publisher)
  end

  def enter_publisher_url(pub_url)
    @browser.text_field(name: 'publisher_url').send_keys(pub_url)
  end

  def enter_language(lang)
    @browser.text_field(name: 'language').send_keys(lang)
  end

  def click_agency_info_tab
    @browser.button(data_id: 'agency-info-tab').click
  end

  def click_save
    @browser.button(data_id: 'save-button').click
  end

  def enter_agency_info_url(agency_info_url)
    @browser.text_field(name: 'gtfs_agency_url').send_keys(agency_info_url)
  end

  def check_for_dashboard_options?
    @browser.a(data_id: 'routes').exists? &&
      @browser.a(data_id: 'stops').exists? &&
      @browser.a(data_id: 'patterns').exists? &&
      @browser.a(data_id: 'calendars').exists? &&
      @browser.a(data_id: 'trips').exists? &&
      @browser.a(data_id: 'blocks').exists?
  end

  def click_all_feeds
    @browser.a(text: 'All Feeds').click
  end

  def title?
    @browser.title
  end
end
