class AddReview0ToProgresses < ActiveRecord::Migration
  def change
    add_column :progresses, :review0, :integer
  end
end
