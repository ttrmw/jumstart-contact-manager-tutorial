require 'test_helper'
require 'capybara/rails'

class PersonViewTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'person view displays person\'s name' do
    visit person_path(Person.first)
    assert_equal true, page.has_content?(Person.first.first_name)
    assert_equal true, page.has_content?(Person.first.last_name)
  end
end
