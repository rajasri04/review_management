class AddPanelIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :panel_id, :integer
  end
end
