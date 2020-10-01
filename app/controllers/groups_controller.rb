class GroupsController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    if @student.group.present?
      group =  @student.group.id
      redirect_to student_group_path(@student,group)
    else
      @group=Group.new
      render 'new'
    end
  end
  def new
    @group=Group.new
  end
  def create
    @group = Group.new(group_params)
    @group.students<<current_student
    if @group.save
        flash[:success] = "Group is successfuly saved"
        redirect_to student_group_path(current_student,@group)
    else
      flash[:failure] = "Try again!!"
      render 'new'
    end
  end
  def show
    @group = Group.find(params[:id])
  end
  def edit

  end
  def update
     @group=Group.find(params[:id])
     friend = Student.find(params[:friend])
     @group.students<<friend
     redirect_to student_groups_path(current_student)
  end
  private
  def group_params
    params.require(:group).permit(:name)
  end
end
