class Users::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication, :only => [ :new, :create]

  def new
    puts ">>>>>>>>>>. hello"
    render :new
  end

  def create
    puts ">>>>>>>>>>. hello"
    session[:user_login] = params[:user].try(:[], :login)
    super do
      log_action :user_sign_in
    end


  end

  def destroy
    user = current_user
    super do
      log_action :user_sign_out, user
    end
  end


end
