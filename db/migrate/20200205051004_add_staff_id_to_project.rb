class AddStaffIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :staff_id, :integer
  end
end
