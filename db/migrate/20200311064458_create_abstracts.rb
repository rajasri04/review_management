class CreateAbstracts < ActiveRecord::Migration
  def change
    create_table :abstracts do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
