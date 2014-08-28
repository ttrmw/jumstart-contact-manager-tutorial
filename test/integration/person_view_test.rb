require 'test_helper'
require 'capybara/rails'

class PersonViewTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'phone number view displays phone number' do
    Person.first.phone_numbers.create(number: 0123)
    visit person_path(Person.first)
    assert_equal true, page.has_content?(Person.first.phone_numbers.first.number)
  end

  test 'person view has link to create new phone number' do
    visit person_path(Person.first)
    page.click_link('Add phone number')
    assert_equal true, page.has_content?('New phone_number')
  end

end
