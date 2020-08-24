class Subsidiary < ApplicationRecord

  belongs_to :company
  validates_presence_of :name 

  has_one :address , dependent: :destroy 
  accepts_nested_attributes_for :address
end
