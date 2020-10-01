class SessionsController < ApplicationController
  def new
  end
  def create
    @staff = Staff.find_by(email: params[:session][:email])
    if @staff!=nil
      if @staff.password == params[:session][:password]
        session[:user_id] = @staff.id
        redirect_to staff_path(@staff.id)
        flash[:success] = "You have successfully logged in"
      else
        flash.now[:error] = "Invalid login credentials"
        render 'new'
      end
    else
        @student = Student.find_by(email: params[:session][:email])
        if @student!=nil
          if @student.password == params[:session][:password]
            session[:student_id] = @student.id
            redirect_to student_path(@student.id)
            flash[:success] = "You have successfully logged in"
          else
            flash.now[:error] = "Invalid login credentials"
            render 'new'
          end
        else
          flash.now[:error] = "Contact admin"
          render 'new'
        end
    end
  end
  def destroy
    session[:user_id] = nil if session[:user_id ]
    session[:student_id] = nil if session[:student_id]
		flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
