class Mutations::CreateSubsidiary < Mutations::BaseMutation 

    description "Admin: Create a Subsidiary"

    argument :name, String, required: false 

    argument :city, String, required: false 
    argument :locality, String, required: false 
    argument :line1, String, required: false 
    argument :lat, String, required: false 
    argument :lng, String, required: false 

    field :subsidiary, Types::SubsidiaryType, null: true 
    field :success, Boolean, null: false 
    field :errors, [String], null: false 

    def resolve(args)

        unless context[:current_user]
            raise Exception, "Sign in to do this action"
        end

        unless context[:current_user].admin? 
            raise Exception, "You do not have permission"
        end

        subsidiary = Subsidiary.new(
            name: args[:name],
            company: context[:current_company]
        )
        args.delete(:name)

        subsidiary.build_address(args)

        if subsidiary.save 
            return {
                subsidiary: subsidiary,
                success: true,
                errors: subsidiary.errors.full_messages
            } 
        else 
            raise ActiveRecord::RecordInvalid, subsidiary
        end

        rescue ActiveRecord::RecordInvalid => invalid 
            return { errors: invalid.record.errors.full_messages, success: false }

        rescue Exception => e 
            return {errors: e.message.split(","), success: false }
    end

end