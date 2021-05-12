class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.integer :instructor_id
      t.integer :student_id
      t.string :level
      t.string :appointment_day

      t.timestamps
    end
  end
end
