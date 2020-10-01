class StaffsController < ApplicationController
  before_action :set_staff, only: [:edit, :update, :destroy]
  before_filter :admin_user, only: [:create, :new, :update, :destroy, :index]
  before_action :correct_user,only: [:displaystudent]

  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.all
  end
  def signup
    @staff = Staff.new
  end
  def reset
    @staff=Staff.find_by_email(params[:staff][:email])
    if @staff != nil
      respond_to do |format|
        if @staff.update(pass_params)
          format.html { redirect_to signin_path, notice: 'Staff was successfully signed up.' }
          format.json { render :show, status: :ok, location: @staff }
        else
          format.html { redirect_to signup_staffs_path }
          format.json { render json: @staff.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:failure]="sign up failure. Meet Admin"
      respond_to do |format|
      format.html { redirect_to signup_staffs_path}
      format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /staffs/1
  # GET /staffs/1.json
  def show
      @staff = Staff.find(params[:id])
  end
  # GET /staffs/new
  def new
    @staff = Staff.new
  end
  # GET /staffs/1/edit
  def edit
  end
  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)
    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end
  def notify
    @staff=Staff.find(params[:id])
    @received_msg=@staff.receiver
  end
  def confirm
    @staff=Staff.find(params[:id])

  end
  def displaystudent
    @staff=Staff.find(params[:id])
    @students=@staff.students
    respond_to do |format|
      format.xls {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=students.xls"
      }
      format.html { render :displaystudent}
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:name, :email, :emp_id)
    end
    def pass_params
      params.require(:staff).permit(:password)
    end
    def correct_user
      @staff= Staff.find(params[:id])
      redirect_to(root_path) unless current_user?(@staff)
    end

end
