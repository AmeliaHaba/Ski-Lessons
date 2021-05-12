class SessionsController < ApplicationController
    def new
    end
  
    def create
      @student = Student.find_by(username: params[:username])
      if @student && @student.authenticate(params[:password])
        session[:student_id] = @student.id
        redirect_to @student
      else
        flash[:danger] = 'Invalid username and password' 
        render 'new'
      end
    end
  
    def destroy
      session.clear
      redirect_to "/"
    end

end 