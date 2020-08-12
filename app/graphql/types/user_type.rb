class Types::UserType < Types::BaseObject
    field :id, ID, null: false
    field :full_name, String, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true


    def full_name 
      object.full_name 
    end
end

