module Types
  class QueryType < Types::BaseObject

    field :current_user, Types::UserType, null: true 

    def current_user
        context[:current_user]
    end

    field :services , [Types::ServiceType], null: true 

    def services 
      Service.all 
    end 

    
  end
end
