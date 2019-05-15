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
    if current_user&.admin?
      render 'list'
    else
      if current_user
        redirect_to profile_path
      else
        redirect_to root_path
      end
    end
  end

  def delete
    @user_to_delete = User.find_by(id: params[:delete_id])
    if current_user&.admin? && @user_to_delete.id != current_user.id
      if @user_to_delete.destroy
        flash[:success] = @user_to_delete.name + ' deleted.'
        redirect_back(fallback_location: root_path)
      else
      flash[:danger] = @user_to_delete.name + 'was not able to be deleted'
      redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger] = 'Improper delete request'
      redirect_back(fallback_location: root_path)
    end
  end

end
