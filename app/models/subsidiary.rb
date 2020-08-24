class Subsidiary < ApplicationRecord
  belongs_to :company
  validates_presence_of :name 
end
