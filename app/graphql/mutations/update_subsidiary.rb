class Mutations::UpdateSubsidiary < Mutations::BaseMutation 

    description "Admin: Update a subsidiary"

    argument :id, ID, required: true 
    argument :name, String, required: false 

    argument :city, String, required: false 
    argument :locality, String, required: false 
    argument :line1, String, required: false 
    argument :lat, String, required: false 
    argument :lng, String, required: false 

    field :subsidiary, Types::SubsidiaryType, null: true 
    field :updated, Boolean, null: false 
    field :errors, [String], null: false 

    def resolve(args)
        unless context[:current_user]
            raise GraphQL::ExecutionError, "Sign in to do this action"
        end

        unless context[:current_user].admin? 
            raise GraphQL::ExecutionError, "You do not have permission"
        end

        subsidiary = Subsidiary.find_by!(id: args[:id], company: context[:current_company])

        subsidiary.name = args[:name] if args[:name]
        
        subsidiary.address.city = args[:city] if args[:city]
        subsidiary.address.locality = args[:locality] if args[:locality]
        subsidiary.address.line1 = args[:line1] if args[:line1]
        subsidiary.address.lat = args[:lat] if args[:lat]
        subsidiary.address.lng = args[:lng] if args[:lng]

        if subsidiary.save 
            return {
                subsidiary: subsidiary,
                errors:subsidiary.errors.full_messages,
                updated: true 
            }
        else  
            raise ActiveRecord::RecordInvalid, subsidiary
        end

        rescue ActiveRecord::RecordNotFound => e  
            return { errors: [e] , updated: false }

        rescue ActiveRecord::RecordInvalid => invalid 
            return { errors: invalid.record.errors.full_messages, updated: false }

        rescue GraphQL::ExecutionError => e 
            return {errors: e.message.split(","), updated: false }
    end 
end