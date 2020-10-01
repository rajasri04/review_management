class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :student_id
      t.string :staff_id
      t.integer :marks
      t.string :comments

      t.timestamps null: false
    end
  end
end
