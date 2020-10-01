class AddReview3ToProgresses < ActiveRecord::Migration
  def change
    add_column :progresses, :review3, :integer
  end
end
