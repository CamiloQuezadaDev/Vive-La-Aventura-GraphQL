module Types
  class SubsidiaryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :address, Types::AddressType, null: true, method: :address 
    field :company, Types::CompanyType, null: true, method: :company 

  end
end
