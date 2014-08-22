require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase

  test 'number is required field' do
    numbers_count = Person.first.phone_numbers.size
    Person.first.phone_numbers.create(number: nil)
    assert_equal numbers_count, Person.first.phone_numbers.size
  end

  test 'number must be associated with person' do
    numbers_count = PhoneNumber.count
    PhoneNumber.create(person_id: nil, number: '2122')
    assert_equal numbers_count, PhoneNumber.count
  end

  test 'phone number can return owner person' do
  	Person.first.phone_numbers.create(number: 12312)
    assert_instance_of(Person, Person.first.phone_numbers.first.person)
  end
end