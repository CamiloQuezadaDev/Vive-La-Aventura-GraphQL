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

    field :subsidiaries_of_current_company, [Types::SubsidiaryType], null: true 

    def subsidiaries_of_current_company
      context[:current_user] && context[:current_user].admin?   ? context[:current_company].subsidiaries : []
    end

    field :subsidiaries, [Types::SubsidiaryType], null: true 

    def subsidiaries
      Subsidiary.all
    end

  end
end
