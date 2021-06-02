class InstructorsController < ApplicationController
    def index 
        @instructors = Instructor.all
        @sorted_instructors = Instructor.all.sort_by {|i| i.lessons.count} #sort_by defaults by ascending order
    end
end
