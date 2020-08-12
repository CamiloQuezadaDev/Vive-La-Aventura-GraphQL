class Types::UserType < Types::BaseObject
    field :id, ID, null: false
    field :full_name, String, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :company, Types::CompanyType, null: false 


    def full_name 
      object.full_name 
    end
end

