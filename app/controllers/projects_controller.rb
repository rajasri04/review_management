class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end
  def new
    @student=Student.find(params[:student_id])
    @project=Project.new
  end
  def create
    @project = Project.new(project_params)
    if @project.save
        flash[:success] = "Project accepted"
         if guide(current_user)
           redirect_to displaystudent_staff_path(@project.staff_id)
        else
          redirect_to '#'
        end
    else
        flash[:failure] = "Try again"
        render 'new'
    end
  end
  def edit
    @student=Student.find(params[:student_id])
    @project=Project.find(params[:id])
  end
  def update
      @project=Project.find(params[:id])
      if @project.update(project_params)
          flash[:success] = "Project updated successfully"
          redirect_to '#'
      else
          flash[:failure] = "Try again"
          render 'new'
      end
  end
  def show
    @project = Project.find(params[:id])
  end
  private
  def project_params
    params.permit(:name, :description,  :email, :panel_id, :staff_id, :group_id )
  end
end
