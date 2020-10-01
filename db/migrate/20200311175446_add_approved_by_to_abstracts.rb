class AddApprovedByToAbstracts < ActiveRecord::Migration
  def change
    add_column :abstracts, :approved_by, :string
  end
end
