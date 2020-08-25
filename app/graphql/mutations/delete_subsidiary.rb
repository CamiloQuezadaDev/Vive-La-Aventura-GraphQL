class Mutations::DeleteSubsidiary < Mutations::BaseMutation 

    description "Admin: Delete a Subsidiary"

    argument :id, ID, required: false 

    field :subsidiary, Types::SubsidiaryType, null: true 
    field :deleted, Boolean, null: false 
    field :errors, [String], null: false 

    def resolve(args)

        unless context[:current_user]
            raise GraphQL::ExecutionError, "Sign in to do this action"
        end

        unless context[:current_user].admin?
            raise GraphQL::ExecutionError, "Sign in to do this action"    
        end

        subsidiary = Subsidiary.find_by!(id: args[:id], company: context[:current_company])

        if subsidiary.destroy  
            return {
                subsidiary: subsidiary,
                deleted: true,
                errors: subsidiary.errors.full_messages
            } 
        else 
            raise ActiveRecord::RecordInvalid, subsidiary
        end

        rescue ActiveRecord::RecordNotFound => e  
            return { errors: [e] , deleted: false } 

        rescue ActiveRecord::RecordInvalid => invalid 
            return { errors: invalid.record.errors.full_messages, deleted: false }

        rescue GraphQL::ExecutionError => e 
            return {errors: e.message.split(","), deleted: false }
    end

end