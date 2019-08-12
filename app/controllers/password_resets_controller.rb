class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :validate_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by_email(params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Password Reset requested. Please check your email for instructions on resetting your password."
      redirect_to root_url
    else
      flash[:danger] = "Email not found. If you believe this is an error, please email us at showmemocktrial@gmail.com"
      redirect_to root_url
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      login @user
      flash[:success] = "Password has been updatesd."
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = 'Error: This link has expired.'
        redirect_to new_password_reset_url
      end
    end

    def get_user
      @user = User.find_by_email(params[:email])
    end
    
    def validate_user
      unless(
        @user&.activated? && @user.authenticated?(:reset, params[:id])) 
        redirect_to root_url
      end
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end
