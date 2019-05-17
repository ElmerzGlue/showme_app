class ActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.activates?(params[:id])
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      login user
      flash[:success] = "Account Activated!"
      redirect_to profile_path
    else
      flash[:danger] = "This link has expired."
      redirect_to root_path
    end
  end
end
