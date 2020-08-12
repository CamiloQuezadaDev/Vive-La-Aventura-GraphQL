class ApplicationController < ActionController::API
    include ActionController::Cookies 

    def current_user 
        token = request.headers["Authorization"].to_s 

        if token.present? 
            user = User.find_by(authentication_token: token)
            cookies.signed[:user_id] = user.try(:id)
        end

        user
    end
end
