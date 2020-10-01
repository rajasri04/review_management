class AddProjectIdToAbstract < ActiveRecord::Migration
  def change
    add_column :abstracts, :project_id, :integer
  end
end
