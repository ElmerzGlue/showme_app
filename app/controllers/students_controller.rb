class StudentsController < ApplicationController
    def delete
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
end
