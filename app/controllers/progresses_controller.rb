class ProgressesController < ApplicationController
  before_action :correct_user, only: [:create,:edit,:update]
  def index
    @staff=Staff.find(params[:staff_id])
    @progresses=@staff.progresses
    @students = Student.all
    respond_to do |format|
      format.xls {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=students.xls"
      }
      format.html { render :index}
    end
  end
  def new
    @staff=Staff.find(params[:staff_id])
    @students=Student.all
    @student=@students.find(params[:student_id])
    @progress=@student.progresses.build
  end
  def create
    @staff=Staff.find(params[:staff_id])
    @students=Student.all
    @student=@students.find(params[:student_id])
    @progress=@student.progresses.new(progress_params)
    if @progress.save
        redirect_to staff_student_progress_path(@staff.id,@student.id,@progress.id)
        flash[:success] = "UR MARKS AND COMMENTS ARE Successfully updated"
    else
      flash[:failure] = "try again"
       render 'new'
    end
  end
  def show
    @staff=Staff.find(params[:staff_id])
    @students=Student.all
    @student=@students.find(params[:student_id])
    @progress=Progress.find(params[:id])
  end
  def edit
    @staff=Staff.find(params[:staff_id])
    @students=Student.all
    @student=@students.find(params[:student_id])
    @progress=Progress.find(params[:id])
  end
  def update
    @staff=Staff.find(params[:staff_id])
    @students=Student.all
    @student=@students.find(params[:student_id])
    @progress=Progress.find(params[:id])
    if @progress.update(progress_params)
        redirect_to staff_student_progress_path(staff_id:@staff.id,student_id:@student.id,id:@progress.id)
        flash[:success] = "Your Marks And Comments Are Successfully updated"
    else
      flash[:failure] = "Update failed.Try again"
       render 'edit'
    end
  end
  private
  def progress_params
    params.require(:progress).permit(:marks,:comments,:student_id,:staff_id, :review0, :review1, :review2, :review3, :approved)
  end
  def correct_user
    @staff= Staff.find(params[:staff_id])
    redirect_to(root_path) unless current_user?(@staff)
  end
end
