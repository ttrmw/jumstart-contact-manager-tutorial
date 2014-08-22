require 'test_helper'
require "capybara/rails"

class PhoneNumberViewTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  setup do

  end

  test 'phone number view displays phone number' do
  	puts page.body
    visit(phone_number_path(PhoneNumber.first))
    assert page.has_content?(PhoneNumber.first)
  end
end