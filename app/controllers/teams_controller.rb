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

    def edit
        if logged_in?
            @team = Team.find(params[:id])
            if current_user.admin? || @team.user == current_user
                render 'edit'
            end
        else
            flash[:danger] = 'Error: Unable to edit team'
            redirect_to root_path
        end
    end

    def addStudent
        @team = Team.find(params[:id])
        if current_user&.admin? || @team.user == current_user
            @student = Student.new
            @student.name = params[:student][:name]
            if @team.students.append(@student)
                flash[:success] = @student.name + ' added!'
                redirect_back(fallback_location: root_path)
            else
                flash[:danger] = "Error: student not able to be added"
                redirect_back(fallback_location: root_path)
            end
        else
            flash[:danger] = "Error: permission denied. Please contact showmemocktrial@gmail.com if you believe this is in error"
            redirect_back(fallback_location: root_path)
        end
    end

end
