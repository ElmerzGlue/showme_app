class UsersController < ApplicationController

	def show
		redirect_to root_path
		# @user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.admin = false
		if num_teams_param
			for n in 0..num_teams_param-1
				@user.teams << Team.new
			end
			if @user.save
				UserMailer.activation(@user).deliver_now
				flash[:success] = "Thank you for registering! Please check your email to activate your account."
				redirect_to root_url
			else
				render 'new'
			end
		else
			render 'new'
		end
	end

	private
		def user_params
			params.require(:new_user).except(:num_teams).permit(:name, :email, :phone,
				:school, :password, :password_confirmation)
		end

  	def num_teams_param
		params.require(:new_user)[:num_teams].to_i
	end

end