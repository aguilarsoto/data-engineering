class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :purchases
  has_many :purchasers, :through => :purchases

end

