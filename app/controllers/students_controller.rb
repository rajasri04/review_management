class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:destroy]
  #before_action :correct_user, only: [:marksdisplay]
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @project=@student.project
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Once Sign in to access the app' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  def marksdisplay
    @student=Student.find(params[:id])
    @progresses=@student.progresses
  end
  def signup
    @student = Student.new
  end
  def reset
    @student=Student.find_by_email(params[:student][:email])
    if @student != nil
      respond_to do |format|
        if @student.update(pass_params)
          format.html { redirect_to signin_path, notice: 'Student was successfully signed up.' }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :signup }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:failure]="sign up failure. Meet Admin"
      respond_to do |format|
      format.html { redirect_to signup_path}
      format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :email, :reg_no, :password, :password_confirmation)
    end
    def pass_params
      params.require(:student).permit(:password)
    end
    def correct_user
      @student = Student.find(params[:id])
      redirect_to(root_path) unless current_user?(@student)
    end

end
