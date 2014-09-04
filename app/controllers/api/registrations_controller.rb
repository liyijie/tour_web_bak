class Api::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  def create
    build_resource(params[:user].to_hash)
    # resource.skip_confirmation!
    if resource.save
      sign_in resource
        render :status => 200,
          :json => { :success => true,
          :info => "Registered",
          :data => { :user => resource,
           :auth_token => current_user.authentication_token } }
     else
          render :status => :unprocessable_entity,
            :json => { :success => false,
            :info => resource.errors,
            :data => {} }
    end
  end
end