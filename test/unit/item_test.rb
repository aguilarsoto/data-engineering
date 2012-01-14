require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should belong_to(:merchant)
  should have_many(:purchases)
  should have_many(:purchasers).through(:purchases)

  should validate_presence_of :description
  should validate_presence_of :price

end
