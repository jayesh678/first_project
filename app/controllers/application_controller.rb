class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
private
  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :firstname, :lastname, :role_id, :company_id, :company_name]) 
  end 

   def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user       = user_email && User.find_by_email(user_email)

    # Use Devise.secure_compare to compare the access_token
    # in the database with the access_token given in the params.
    if user && Devise.secure_compare(user.access_token, params[:access_token])

      # Passing store false, will not store the user in the session,
      # so an access_token is needed for every request.
      # If you want the access_token to work as a sign in token,
      # you can simply remove store: false.
      sign_in user, store: false
    end
  end
end
