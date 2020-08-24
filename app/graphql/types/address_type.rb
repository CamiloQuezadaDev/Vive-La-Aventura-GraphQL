module Types
  class AddressType < Types::BaseObject
    field :id, ID, null: false
    field :line1, String, null: true
    field :lat, Float, null: true
    field :lng, Float, null: true
    field :city, String, null: true
    field :locality, String, null: true
    field :Subsidiary, Types::SubsidiaryType, null: true
  end
end
