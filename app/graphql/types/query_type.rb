module Types
  class QueryType < Types::BaseObject

    field :me, Types::UserType, null: true 

    def me
        context[:current_user]
    end

    field :services , [Types::ServiceType], null: true 

    def services 
      
      Service.all 
      
    end 

  end
end
