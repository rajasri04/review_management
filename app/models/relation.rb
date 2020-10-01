class Relation < ActiveRecord::Base
  belongs_to :student
  belongs_to :staff
  validates_uniqueness_of :staff_id, :scope => :student_id

  def regno
  end
  def regno=(formreg)
    @stu=Student.find_by_reg_no(formreg)
    @stuid=@stu.id
    self.student_id= @stuid
  end
  def emp_id
  end
  def emp_id=(formemp)
    @sta=Staff.find_by_emp_id(formemp)
    @staid=@sta.id
    self.staff_id= @staid
  end
end
