class AddApprovedToAbstract < ActiveRecord::Migration
  def change
    add_column :abstracts, :approved, :boolean
  end
end
