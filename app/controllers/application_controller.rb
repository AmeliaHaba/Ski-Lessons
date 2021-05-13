class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?
    helper_method :current_student

    def home
        render "/home"
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to home_path
        end
    end 

    # def wrong_page
    #     render "/wrong_page"
    # end


    def current_student
        @student = Student.find_by_id(session[:student_id])
    end
    
    def logged_in?
        !current_student.nil?
    end
end
