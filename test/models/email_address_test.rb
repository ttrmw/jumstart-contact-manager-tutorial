require 'test_helper'

class EmailAddressTest < ActiveSupport::TestCase

  test 'address is required field' do
    assert_no_difference 'Person.first.email_addresses.count' do
      Person.first.email_addresses.create(address: nil)
    end
  end

  test 'address must be associated with person' do
    assert_no_difference 'EmailAddress.count' do
      EmailAddress.create(person_id: nil, address: '1 foo st')
    end
  end

end
