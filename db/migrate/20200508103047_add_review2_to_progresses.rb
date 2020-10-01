class AddReview2ToProgresses < ActiveRecord::Migration
  def change
    add_column :progresses, :review2, :integer
  end
end
