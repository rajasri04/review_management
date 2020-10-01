class AbstractsController < ApplicationController
  def index
    if params[:staff_id]
      @staff = Staff.find(params[:staff_id])
      @students =  @staff.students
    else
      @abstracts = Abstract.all
    end
  end

  def new
    @abstract = Abstract.new
  end

  def create
    @abstract = Abstract.new(abstract_params)
     if @abstract.save
        redirect_to current_student, notice: "The abstract #{@abstract.name} has been uploaded."
     else
        render "new"
     end
  end
  def show
    @staff = Staff.find(params[:staff_id]) if params[:staff_id]
    @abstract=Abstract.find(params[:id])
    @project=@abstract.project
    @group=@project.group
  end
  def destroy
     @abstract = Abstract.find(params[:id])
     @abstract.destroy
     redirect_to abstracts_path, notice:  "The abstract #{@abstract.name} has been deleted."
  end
  def accept
     @abstract=Abstract.find(params[:id])
     @project=@abstract.project
     respond_to do |format|
      if current_user.admin?
           @abstract.update(final_approval: true)
           format.html { redirect_to @abstract, notice: 'IT iS approved .' }
      end
         if @abstract.update(approved: true,approved_by: @project.staff.name)
           format.html { redirect_to @abstract, notice: 'IT iS approved .' }
           format.json { render :show, status: :ok, location: @abstract }
         else
           format.html { render :show }
           format.json { render json: @abstract.errors, status: :unprocessable_entity }
         end
     end
  end
  def reject
    @abstract=Abstract.find(params[:id])
    @project=@abstract.project
    respond_to do |format|
        if @abstract.update(approved: false)
          format.html { redirect_to @abstract, notice: 'The abstract has been rejected.' }
          format.json { render :show, status: :ok, location: @abstract }
        else
          format.html { render :show }
          format.json { render json: @abstract.errors, status: :unprocessable_entity }
        end
    end
  end
  private
  def abstract_params
    params.require(:abstract).permit(:name, :attachment ,:project_id)
  end
end
