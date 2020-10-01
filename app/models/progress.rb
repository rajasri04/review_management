class Progress < ActiveRecord::Base
  belongs_to :student
  belongs_to :staff
  def marks
    if (self.review0 != nil) & (self.review1 != nil) & (self.review2 != nil) & (self.review3 != nil)
      (self.review0 + self.review1 + self.review2 + self.review3)/4.to_f
    end
  end

end
