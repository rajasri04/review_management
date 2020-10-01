class CreatePanelsStaffs < ActiveRecord::Migration
  def change
    create_table :panels_staffs do |t|
      t.references :staff, index: true, foreign_key: true
      t.references :panel, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index(:panels_staffs, [:staff_id, :panel_id], :unique => true)
  end
end
