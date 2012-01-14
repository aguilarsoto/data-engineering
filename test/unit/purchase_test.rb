require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  should belong_to(:item)
  should belong_to(:purchaser)

  should belong_to(:upload)
  should validate_presence_of(:quantity)
  should validate_numericality_of(:quantity)
end
