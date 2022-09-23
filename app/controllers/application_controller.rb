class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_customer_sign_in_path_for(resource)
    # flash[:notice]="Welcome! You have signed up successfully."
    public_about_path(resource)
  end
  def after_customer_sign_out_path_for(resource)
    # flash[:notice]="Signed out successfully."
    root_path(resource)
  end

  def after_admin_sign_in_path_for(resource)
    # flash[:notice]="Welcome! You have signed up successfully."
    admin_items_path(resource)
  end
  def after_admin_sign_out_path_for(resource)
    # flash[:notice]="Signed out successfully."
    admin_root_path(resource)
  end


  protected

  def configure_permitted_parameters
    # flash[:notice]="Signed in successfully."
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

end
