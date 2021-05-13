class StudentsController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:show]

    def new
        @student = Student.new
    end 

    def create 
        student = Student.new(student_params)
        if student.save 
            session[:student_id] = student.id 
            redirect_to student_path(student) # running student.id in the backend 
        else 
            redirect_to new_student_path # back to sign up form
        end
    end 

    def show
        @student = Student.find(params[:id])
    end 


    private 

    def student_params
        params.require(:student).permit(:username, :password, :password_confirmation, :name, :email, :phone_number)
    end

end
