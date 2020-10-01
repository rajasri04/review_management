class MessagesController < ApplicationController
  def index
    if current_student
       @student= Student.find(params[:student_id])
       @sent_msg = @student.sender
       @received_msg = @student.receiver
    else
      @staff= Staff.find(params[:staff_id])
      @sent_msg = @staff.sender
      @received_msg = @staff.receiver
    end
  end
  def new
    @message = Message.new
  end
  def create
    params.permit!
    f_d = params[:message]
    process_fd(f_d)
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.save
        format.html { redirect_to student_messages_path(@message.student_id), notice: 'Request is submitted and wait for the result.'}
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @message = Message.find(params[:id])
    @student = Student.find_by_email(@message.from)
    @group = @student.group
  end
  def accept
    @message = Message.find(params[:id])
    if @message.update(accepted: true)
    
    else

    end
  end
  private
  def process_fd(field_details)
    project_name=field_details.delete(:project_name)
    project_des=field_details.delete(:project_description)
    details = (field_details[:content] || {})
    details[:meta] = {}
    details[:meta][:project_name]=project_name if project_name.present?
    details[:meta][:project_des]=project_des if project_des.present?
    field_details[:content]=details if details[:meta].present?
    field_details[:content]=field_details[:content].to_json
  end
end
