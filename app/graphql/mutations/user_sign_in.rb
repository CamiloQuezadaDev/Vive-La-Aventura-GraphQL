class Mutations::UserSignIn < Mutations::BaseMutation
    description 'Admin User: Sign In'

    argument :email, String, required: true 
    argument :password, String, required: true 

    field :user, Types::UserType, null: true 
    field :errors, [String], null: true 
    field :exists, Boolean, null: true
    field :token, String, null: true 

    def resolve(email:, password: nil)

        user = User.find_by(email: email)
        
        result = {}

        unless user.present? 
            result[:errors] = ["User doesn't found. Check email address"]
            result[:exists] = false 
            return result 
        end

        if password.nil? 
            result[:errors] = ["Password required"]
            result[:exists] = true 
            return result 
        end

        unless user.valid_password?(password)
            result[:errors] = ["Wrong password"]
            result[:exists] = true 
            return result 
        end

        result = {
            token: user.authentication_token,
            user: user,
            errors: [],
            exists: true 
        }


    end

end