require 'test_helper'
require "capybara/rails"

class PhoneNumberViewTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  setup do
    #any required setup
  end

  test 'phone number view displays phone number' do
    visit(phone_number_path(PhoneNumber.first))
    assert_equal true, page.has_content?(PhoneNumber.first.number)
  end
end