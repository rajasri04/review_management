class RemoveStudentIdFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :student_id, :integer
  end
end
