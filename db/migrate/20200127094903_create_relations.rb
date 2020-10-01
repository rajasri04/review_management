class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :student_id
      t.integer :staff_id

      t.timestamps null: false
    end
      add_index(:relations, [:student_id, :staff_id], :unique => true)
  end
end
