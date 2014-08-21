require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test 'Person requires first_name' do
    person_requires(:first_name)
  end

  test 'Person requires last_name' do
    person_requires(:last_name)
  end

  def person_requires(field)
    number_of_people = Person.count
    test = Person.new
    test.attributes.each do |key, value|
      test.attributes[key] = "foo" unless key = field.to_s
    end
    test.save
    assert_equal number_of_people, Person.count
  end

end
