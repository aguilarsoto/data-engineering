class Purchase < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchaser
  belongs_to :upload

  validates_presence_of :quantity
  validates_numericality_of :quantity

end
