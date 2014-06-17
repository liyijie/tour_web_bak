class Api::RegistrationsController < Devise::RegistrationsController

  skip_before_filter :verify_authenticity_token,
  :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    build_resource(email: params[:user][:email], password: params[:user][:password], 
        password_confirmation: params[:user][:password_confirmation])
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