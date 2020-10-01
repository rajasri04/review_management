class AddCategoryToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :category, :number
  end
end
