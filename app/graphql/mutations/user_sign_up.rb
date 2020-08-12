class Mutations::UserSignUp < Mutations::BaseMutation

    description "Sign Up to Admin User of the company"

    argument :firstName, String, required: true 
    argument :lastName, String, required: true 
    argument :email, String, required: true 
    argument :password, String, required: true 


    field :user, Types::UserType, null: true 
    field :success, Boolean, null: true 
    field :token, String, null: true 
    field :errors, [String], null: true 


    def resolve(args)
        user = User.new(args)

        if user.save! 
            user.add_role :admin
        else  
            raise ActiveRecord::RecordInvalid, user 
        end

        Mutations::MutationResult.call(
            obj: { user: user },
            success: user.persisted?, 
            errors: user.errors.full_messages,
            token: user.authentication_token
        )

        rescue ActiveRecord::RecordInvalid => invalid 
            return { errors: invalid.record.errors.full_messages, success: false }

        rescue Exception => e 
            return {errors: e.message.split(','), success: false }

    end
end