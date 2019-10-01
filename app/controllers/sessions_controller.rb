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
      #Unsuccessful
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  def profile
    if activated?
      render 'profile'
    else
      render 'activate'
    end
  end

  def list
    admin_page('list')
  end

  def delete
    @user_to_delete = User.find_by(id: params[:delete_id])
    if current_user&.admin? && @user_to_delete.id != current_user.id
      if @user_to_delete.destroy
        flash[:success] = @user_to_delete.name + ' deleted.'
        redirect_back(fallback_location: root_path)
      else
      flash[:danger] = @user_to_delete.name + 'was not able to be deleted. Contact server admin for details'
      redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger] = 'Improper delete request'
      redirect_back(fallback_location: root_path)
    end
  end

  def pay_registration
    @user_to_pay = User.find_by(id: params[:pay_id])
    @user_to_pay.paid_registration = true
    if current_user.admin? && @user_to_pay.save
      flash[:success] = @user_to_pay.name + ' marked as having paid registration fee'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'Invalid Request: If you are a tournament administrator, please contact the server admin.'
      redirect_back(fallback_location: root_path)
    end
  end

  def resend
    if current_user
      current_user.redo_activation_digest
      UserMailer.activation(current_user).deliver_now
      flash[:success] = 'Resent activation email.'
      redirect_to root_path
    end
  end

  def teams
    # render 'teams'
  end

  def edit_team
    
  end

  def admin_page(page)
    if current_user&.admin?
      render page
    else
      if current_user
        redirect_to profile_path
      else
        redirect_to root_path
      end
    end
  end

end
