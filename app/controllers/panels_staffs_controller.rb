class PanelsStaffsController < ApplicationController
  def new
    @panelstaff=PanelsStaff.new
  end
  def create
    @panelstaff=PanelsStaff.new
    @panel = Panel.find(params[:panels_staff][:panel_id])
    @staff = Staff.find_by_emp_id(params[:panels_staff][:emp_id])
    if (@staff != nil)
      e = @staff.panels << @panel
      if e
      redirect_to new_panels_staff_path
      flash[:success] = "Panel are alloted for staff"
      else
            redirect_to new_panels_staff_path
            flash[:failure] = "Panel are not alloted for staff.Try again"
      end
    else
        redirect_to new_panels_staff_path
        flash[:failure] = "Staff id is wrong"
    end
  end
end
