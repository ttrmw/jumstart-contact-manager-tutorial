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
end