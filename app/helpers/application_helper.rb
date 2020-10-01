module ApplicationHelper
  def panel(current_user)
     !current_user.panels.empty?
  end
  def current_student
     @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end
end
