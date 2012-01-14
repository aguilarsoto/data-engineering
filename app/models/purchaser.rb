class Purchaser < ActiveRecord::Base
  has_many :purchases
  has_many :items, :through => :purchases

  validates_presence_of :name
end
