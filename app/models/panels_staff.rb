class PanelsStaff < ActiveRecord::Base
  validates_uniqueness_of :panel_id, :scope => :staff_id
  belongs_to :staff
  belongs_to :panel

  def emp_id
  end
  def emp_id=(formemp)
    @sta=Staff.find_by_emp_id(formemp)
    @staid=@sta.id
    self.staff_id= @staid
  end
end
