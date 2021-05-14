class LessonsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @lessons = current_student.lessons
    end

    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = Lesson.new(lesson_params)
        @lesson.student = current_student
        if @lesson.save
            redirect_to student_lesson_path(student_id: current_student.id, id: @lesson.id)
        else 
            render :new
        end   
    end

    def show
        @lesson = Lesson.find(params[:id])
    end

    def edit
        @lesson = Lesson.find(params[:id])
    end 

    def update
        @lesson = Lesson.find(params[:id])
        @lesson.update(lesson_params)
        redirect_to student_lesson_path(@lesson)
    end 

    def destroy
        @lesson = Lesson.find(params[:id])
        @lesson.destroy
        redirect_to student_lessons_path
    end 

    private

    def lesson_params
        params.require(:lesson).permit(:instructor_id, :student_id, :level, :appointment_day)
    end
       

end
