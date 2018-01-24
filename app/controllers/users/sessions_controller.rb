class Users::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication, :only => [ :new, :create]

  def new
    render :new
  end

  def create
    if user = User.find_for_authentication(email: params[:email])
      if user.valid_password?(params[:password])
        sign_in user
      else

      end
    else

    end
    # redirect_to root_path
  end


end
