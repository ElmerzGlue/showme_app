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

    def schedule
        if !(current_user&.admin?)
            flash[:danger] = "Error: Permission Denied"
            redirect_to root_path
            return
        end
        render 'schedule'
    end

    def score_form
        if !(current_user&.admin?)
            flash[:danger] = "Error: Permission Denied"
            redirect_to root_path
            return
        end
        @trial = Trial.find(params[:id])
        render 'score'
    end

    def score
        if !(current_user&.admin?)
            flash[:danger] = "Error: Permission Denied"
            redirect_to root_path
            return
        end
        @trial = Trial.find(params[:id])
        @trial.ballot_1.update_attributes(ballot_1_params)
        @trial.ballot_2.update_attributes(ballot_2_params)
        @trial.judge_ballot.update_attributes(judge_ballot_params)
        if @trial.score
            flash[:success] = "Trial Scored!"
            redirect_to(trials_list_path, fallback_location: root_path)
        else
            flash[:danger] = "Error"
        end
        
    end

    private
        def trial_params
            params.require(:trial).permit(:p_team_id, :d_team_id)
        end
        def ballot_1_params
            params.require(:scoring_data).require(:ballot_1).permit(:attorney_1_id, :attorney_2_id, :attorney_3_id,
                :witness_1_id, :witness_2_id, :witness_3_id, :p_points, :d_points)
        end
        def ballot_2_params
            params.require(:scoring_data).require(:ballot_2).permit(:attorney_1_id, :attorney_2_id, :attorney_3_id,
                :witness_1_id, :witness_2_id, :witness_3_id, :p_points, :d_points)
        end
        def judge_ballot_params
            params.require(:scoring_data).require(:judge_ballot).permit(:attorney_1_id, :attorney_2_id, :attorney_3_id,
                :witness_1_id, :witness_2_id, :witness_3_id, :p_won)
        end
end