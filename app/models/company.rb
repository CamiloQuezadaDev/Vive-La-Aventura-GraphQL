class Company < ApplicationRecord
    has_many :users, dependent: :destroy 

    belongs_to :service 

    validates_presence_of :name 
    
    accepts_nested_attributes_for :users
end
