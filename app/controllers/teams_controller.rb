class TeamsController < ApplicationController

    def show
    end

    def show_register
        if logged_in?
            @team = Team.find(params[:id])
            if @team.user == current_user
                render 'show_register'
            end
        end
        flash[:danger] = 'Unable to register team. if you believe this is in error, email showmemocktrial@gmail.com'
        redirect_to root_path
    end

end
