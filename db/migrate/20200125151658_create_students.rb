class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.integer :reg_no,:limit =>8
      t.timestamps null: false
    end
  end
end
