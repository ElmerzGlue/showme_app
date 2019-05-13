class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Successful login
      login user
      flash[:success] = 'Hello, ' + current_user.name + '!'
      redirect_to profile_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  def profile
  end

  def list
    if current_user.admin?
      render 'list'
    else
      redirect_to current_user
    end
  end

end
