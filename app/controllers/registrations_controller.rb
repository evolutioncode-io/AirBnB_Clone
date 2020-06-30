class RegistrationsController < Devise::RegistrationsController
    protected
    #To can edit and update a profile with Facebook login without a password
    def update_resource(resource, params)
        resource.update_without_password(params)
    end
end
