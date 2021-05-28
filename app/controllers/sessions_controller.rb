class SessionsController < ApplicationController
  def new
  end
  
  def create
    @student = Student.find_by(email: params[:email])
    if @student && @student.authenticate(params[:password])
      session[:student_id] = @student.id
      redirect_to @student
    else
      flash[:danger] = 'Incorrect username and password'
      render :new
    end
  end

  def google
    @student = Student.find_or_create_by(email: auth["info"]["email"]) do |student|
      student.password = SecureRandom.hex(10)
      student.username = auth["info"]["username"]
      student.first_name = auth["info"]["first_name"]
      student.last_name = auth["info"]["last_name"]
    end
    if student
        session[:student_id] = student.id
        redirect_to student_path(student)
    else
      redirect_to "/"
    end
  end
 
  def destroy
    session.clear
    redirect_to "/"
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end 