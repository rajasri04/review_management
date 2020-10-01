class RelationController < ApplicationController
  def index
    @relations=Relation.all
  end
  def new
    @relation = Relation.new
  end
  def create
    @relation = Relation.new(asso_params)
    respond_to do |format|
      if @relation != nil
        if @relation.save
          @student = Student.find_by_reg_no(params[:relation][:regno])
          @staff = Staff.find_by_emp_id(params[:relation][:emp_id])
          @staff.students<<@student
          format.html { redirect_to staffs_path, notice: 'Allotment was successfully created.' }
          format.json { render :show, status: :created, location: @relation }
        else
          format.html { render :new }
          format.json { render json: @relation.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @relation.destroy
    respond_to do |format|
      format.html { redirect_to relation_path, notice: 'Allotment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  def asso_params
      params.require(:relation).permit(:regno,:emp_id)
  end
end
