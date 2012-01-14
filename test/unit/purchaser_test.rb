require 'test_helper'

class PurchaserTest < ActiveSupport::TestCase

  should have_many(:purchases)
  should have_many(:items).through(:purchases)

end
