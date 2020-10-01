class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to
      t.string :from
      t.string :content

      t.timestamps null: false
    end
  end
end
