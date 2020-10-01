class CreateStaffsStudents < ActiveRecord::Migration
  def change
    create_table :staffs_students ,:id => false do |t|
      t.references :student, null: false
      t.references :staff, null: false

    end
    add_index(:staffs_students, [:student_id, :staff_id], :unique => true)
  end
end
