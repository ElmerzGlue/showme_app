class TrialsController < ApplicationController
    def new
        if current_user&.admin?
            render 'new'
        else
            flash[:danger] = "Error: Permission Denied"
            redirect_to root_path
        end
    end

    def create
        if !(current_user&.admin?)
            flash[:danger] = "Error: Permission Denied"
            redirect_to root_path
            return
        end
        @trial = Trial.new
        @trial.p_team = Team.find_by_id(trial_params[:p_team_id])
        @trial.d_team = Team.find_by_id(trial_params[:d_team_id])
        if @trial.save
            flash[:success] = "Trial scheduled between " + @trial.p_team.user.school + " and " + @trial.d_team.user.school + "."
        else
            Rails.logger.debug @trial.errors.full_messages.join("\n")
        end
        redirect_to trials_schedule_path
    end

    private
        def trial_params
            params.require(:trial).permit(:p_team_id, :d_team_id)
        end
end