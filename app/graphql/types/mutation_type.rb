module Types
  class MutationType < Types::BaseObject

    field :user_sign_up, mutation: Mutations::UserSignUp
    field :user_sign_in, mutation: Mutations::UserSignIn 
    
    field :create_subsidiary, mutation: Mutations::CreateSubsidiary
    field :update_subsidiary, mutation: Mutations::UpdateSubsidiary 
    
  end
end
