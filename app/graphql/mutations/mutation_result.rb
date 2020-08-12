class  Mutations::MutationResult 
    def self.call(obj: {},success: true,errors: [],token: nil)
        obj.merge(success: success,errors: errors, token: token)
    end
end