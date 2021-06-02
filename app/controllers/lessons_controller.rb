class LessonsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @lessons = current_student.lessons
        @beginner_lessons = Lesson.beginner_level
        @intermediate_lessons = Lesson.intermediate_level
        @advanced_lessons = Lesson.advanced_level
    end

    def new
        #@lesson = Lesson.new #getting empty instance of lesson
        @lesson = current_student.lessons.build
    end

    def create
    @lesson = current_student.lessons.build(lesson_params)
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
        redirect_to student_lesson_path(current_student, @lesson)
    end 

    def destroy
        @lesson = Lesson.find(params[:id])
        @lesson.destroy
        redirect_to student_lessons_path
    end 

    def lesson_with_chuck
        @lesson = current_student.lessons.build(instructor_id: 1, level: "intermediate", appointment_day: "Monday")
        @lesson.save
        redirect_to student_lessons_path(current_student)
    end


    private

    def lesson_params
        params.require(:lesson).permit(:instructor_id, :level, :appointment_day)
 end

end
