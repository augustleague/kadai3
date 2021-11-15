class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except:[:top, :about]
   before_action :configure_permitted_parameters, if: :devise_controller?
   def after_sign_in_path_for(resource)
     user_path(current_user)
   end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  def login
    flash[:notice] = "Signed in successfully."
    @user = User.find_by(params[:id])
  end
  
  def sign_up
    flash[:notice] = "Welcome! You have signed up successfully."
    @user = User.new(params[:id])
  end
  
  def log_out
    flash[:notice] = "Signed out successfully."
    @user = User.find_by(params[:id])
  end
  
end
