class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
      @current_user ||= Staff.find(session[:user_id]) if session[:user_id]
  end
  def signed_in?
     !current_user.nil?
  end
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
  def current_student
     @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end
  def signed_in_student?
     !current_student.nil?
  end
  def current_user?(user)
       user == current_user
  end
  def guide(current_user)
     !current_user.projects.empty?
  end
  def panel(current_user)
     !current_user.panels.empty?
  end
end
