require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  
  should belong_to(:item)
  should belong_to(:purchaser)

end
