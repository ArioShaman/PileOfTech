class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  layout proc {
    if request.xhr?
      false
    else
      "application"
    end
  }
  
  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, :notice => 'if you want to add a notice'
    end  
  end
    
  def after_sign_in_path_for(resource)
    return profile_index_url  
  end  
end
