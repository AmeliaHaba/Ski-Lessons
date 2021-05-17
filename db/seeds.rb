# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Lesson.destroy_all
Instructor.destroy_all
Student.destroy_all 


10.times do 
    Student.create!(
        name: Faker::Name.name,
        username: Faker::TvShows::TwinPeaks.unique.character,
        password: "Password",
        age: rand(3..72),
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone.to_i
    )
end

instructor_one = Instructor.create!(

    name: "Chuck Haba",
    bio: "Expert skier, teaches adults of all skill levels."
)

instructor_two = Instructor.create!(
    name: "Donna Diener",
    bio: "Expert skier, teaches children and young adults of all skill levels."
)

35.times do
    Lesson.create!(
        instructor_id: [instructor_one.id, instructor_two.id].sample,
        student: Student.all.sample, 
        level: ["beginner", "intermediate", "advanced"].sample,
        appointment_day: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", 
                          "Sunday"].sample
        
    )
end

puts "I am not sane, I need a cigarette and wine."