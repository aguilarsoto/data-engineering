require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  should have_many(:items)
  should validate_presence_of :name
  should validate_presence_of :address

end
