require 'test_helper'
require "capybara/rails"

class PhoneNumberViewTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'phone number view displays phone number' do
    visit(phone_number_path(PhoneNumber.first))
    assert page.has_content?(PhoneNumber.first.number)
  end

  test 'edit phone_number redirects to owner of the phone number.' do
    visit edit_phone_number_path(PhoneNumber.first)
    page.click_button('Update Phone number')
    assert current_path == person_path(PhoneNumber.first.person)
  end

  test 'edit phone number changes phone number' do 
    p = Person.first.phone_numbers.first
    old_number = p.number
    visit edit_phone_number_path(p)
    page.fill_in('Number', with: '129392919')
    page.click_button('Update Phone number')
    assert page.has_content?('129392919')
    assert_not page.has_content? old_number
  end 
end

