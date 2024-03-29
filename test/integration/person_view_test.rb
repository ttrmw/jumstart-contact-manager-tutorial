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

  test 'add phone number link adds phone number' do
    phone_no = '123999'
    visit person_path(Person.first)
    page.click_link('Add phone number')
    page.fill_in('Number', with: phone_no)
    page.click_button('Create Phone number')
    assert page.has_content?(phone_no)
  end

  test 'add phone number redirects to owner of new phone number' do
    phone_no = '1239239'
    visit person_path(Person.first)
    page.click_link('Add phone number')
    page.fill_in('Number', with: phone_no)
    page.click_button('Create Phone number')
    assert current_path == person_path(Person.first)
  end

  test 'person view has links to edit phone numbers' do
    p = Person.first
    visit person_path(p)
    p.phone_numbers.each do |phone|
      assert page.has_xpath? "//a[@href='#{edit_phone_number_path(phone)}']"
    end
  end

  test 'person view has links to delete phone numbers' do
    p = Person.first
    visit person_path(p)
    p.phone_numbers.each do |phone|
      assert page.has_xpath? "//a[@href='#{phone_number_path(phone)}']"
    end
  end

end


