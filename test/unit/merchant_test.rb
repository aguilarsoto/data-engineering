require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  
  should have_many(:items)

end
