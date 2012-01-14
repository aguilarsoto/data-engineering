class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :purchases
  has_many :purchasers, :through => :purchases

  validates_presence_of :description, :price

end

