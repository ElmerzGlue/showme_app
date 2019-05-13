class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.admin = false
		if @user.save && num_teams_param > 0
			for n in 0..num_teams_param-1
				@user.teams.create(user_id: @user.id)
			end
			flash[:success] = "Thank you for registering!"
			redirect_to @user
		else
			@user.destroy
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :phone,
				:school, :password, :password_confirmation)
		end

  	def num_teams_param
			params[:user][:teams].to_i
		end

end