require 'test_helper'
require "capybara/rails"

class PhoneNumberViewTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'phone number view displays phone number' do
    visit(phone_number_path(PhoneNumber.first))
    assert page.has_content?(PhoneNumber.first.number)
  end

end