class Address < ApplicationRecord
  belongs_to :subsidiary

  validates_presence_of :lat,:lng,:line1 

  validates :lat, numericality: { only_float: true }
  validates :lng, numericality: { only_float: true }
end
