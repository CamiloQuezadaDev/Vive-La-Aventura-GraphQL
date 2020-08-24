module Types
  class CompanyType < Types::BaseObject

    field :id, ID, null: false
    field :name, String, null: true
    field :service, Types::ServiceType, null: true
    field :subsidiaries, [ Types::SubsidiaryType ], null: true 

  end
end
