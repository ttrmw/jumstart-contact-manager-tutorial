require 'test_helper'
require 'capybara/rails'

class PersonViewEmailAddressTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'person view displays email addresses' do
    Person.first.email_addresses.create(address: "foo@bar.baz")
    visit person_path(Person.first)
    assert_equal true, page.has_content?(Person.first.email_addresses.first.address)
  end

end