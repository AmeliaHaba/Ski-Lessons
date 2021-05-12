class LessonsController < ApplicationController
    
    def index
        @lessons = Lesson.all
    end

    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = Lesson.new(lesson_params)
    end

    private

    def lesson_params
        params.require(:lesson).permit(:level, :appointment, :time)
    end
       


end
