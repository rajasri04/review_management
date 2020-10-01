class AddApprovedToProgresses < ActiveRecord::Migration
  def change
    add_column :progresses, :approved, :boolean
  end
end
