class StudentsController < ApplicationController
    include ApplicationHelper

    def delete
        if Time.zone.now > day_of_comp
            flash[:danger] = "Competition has started, teams are locked!"
            redirect_back(fallback_location: root_path)
            return nil
        end
        @student_to_delete = Student.find(params[:id])
        if current_user&.admin? || current_user == @student_to_delete.team.user
            if @student_to_delete.destroy
                flash[:success] = @student_to_delete.name + " deleted."
                redirect_back(fallback_location: root_path)
            else
                flash[:danger] = @student_to_delete.name + " could not be deleted. Please contact showmemocktrial@gmail.com if you believe this is in error"
                redirect_back(fallback_location: root_path)
            end
        else
            flash[:danger] = "Error: permission denied. Please contact showmemocktrial@gmail.com if you believe this is in error."
            redirect_back(fallback_location: root_path)
        end
    end

    def rankings
        if !current_user&.admin?
            flash[:danger] = 'Error: Permission Denied'
            redirect_to root_path
        end
        render 'rankings'
    end
end
