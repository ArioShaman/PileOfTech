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
      redirect_to login_path, :notice => 'if you want to add a notice'
    end  
  end
end
