class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.integer :age
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
