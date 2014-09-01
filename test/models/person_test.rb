
require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test 'Person requires first_name' do
    number_of_people = Person.count
    Person.create last_name: "bar"
    assert_equal number_of_people, Person.count
  end

  test 'Person requires last_name' do
    number_of_people = Person.count
    Person.create first_name: "foo"
    assert_equal number_of_people, Person.count
  end

  test 'Person has array of phone numbers' do
    person = Person.create first_name: "foo", last_name: "bar"
    assert_equal person.phone_numbers, []
  end

  test 'Person has an array of emails' do
    person = Person.create first_name: "bar", last_name: "baz"
    assert_equal person.email_addresses, []
  end
end