class PanelController < ApplicationController
  def new

  end
  def index
    @staff=Staff.find(params[:staff_id])
    @panels=@staff.panels
  end
  def show
    @panel=Panel.find(params[:id])
    @projects=@panel.projects
  end
  def create

  end
end
