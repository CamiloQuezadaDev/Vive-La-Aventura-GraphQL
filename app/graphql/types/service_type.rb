module Types
  class ServiceType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :companies, [Types::CompanyType], null: true 
  end
end
