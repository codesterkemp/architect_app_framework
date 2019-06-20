# frozen_string_literal: true

require 'watir'

class LoginPage
  def initialize(browser)
    @browser = browser
  end

  def enter_username(username)
    @browser.text_field(id: 'username').send_keys(username)
  end

  def enter_password(password)
    @browser.text_field(id: 'password').send_keys(password)
  end

  def click_login_button
    @browser.button(text: 'Log in').click
  end

  def click_forgot_password
    @browser.link(text: 'Forgot your password?').click
  end

  def warning_message_displayed?
    @browser.div(text: 'Incorrect username/email or password.').present?
  end

  def title?
    @browser.title
  end
end
