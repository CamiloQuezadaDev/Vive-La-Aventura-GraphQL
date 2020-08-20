class Service < ApplicationRecord
    validates_presence_of :name 
    has_many :companies 
end
