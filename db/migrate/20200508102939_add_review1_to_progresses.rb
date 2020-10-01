class AddReview1ToProgresses < ActiveRecord::Migration
  def change
    add_column :progresses, :review1, :integer
  end
end
