class Lesson < ApplicationRecord
    belongs_to :instructor
    belongs_to :student 

    validates :appointment_day, presence: true
    validates :level, presence: true 

    scope :beginner_level, -> {where(level: "beginner")}
    scope :intermediate_level, -> {where(level: "intermediate")}
    scope :advanced_level, -> {where(level: "advanced")}

end
