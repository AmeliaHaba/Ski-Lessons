class Instructor < ApplicationRecord
    has_many :lessons
    has_many :students, through: :lessons

    validates :name, uniqueness: true, presence: true  
end
