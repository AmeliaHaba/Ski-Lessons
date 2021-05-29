class Student < ApplicationRecord
    has_many :lessons
    has_many :instructors, through: :lessons

    validates :username, presence: true 
    validates :email, uniqueness: true, presence: true 

    has_secure_password 
end
