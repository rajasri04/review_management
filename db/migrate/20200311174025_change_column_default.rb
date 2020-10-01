class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default :abstracts, :approved, false
  end
end
