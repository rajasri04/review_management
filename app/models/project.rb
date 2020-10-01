class Project < ActiveRecord::Base
  belongs_to :group
  belongs_to :panel
  belongs_to :staff
  has_many :abstracts
  has_many :students, through: :group
  def email
  end
  def email=(formreg)
    @stu=Staff.find_by_email(formreg)
    if(!@stu.present?)
      errors.add(:email, "enter the valid email id")
      debugger
      return false
    end
    @stuid=@stu.id
    self.staff_id= @stuid
  end
end
