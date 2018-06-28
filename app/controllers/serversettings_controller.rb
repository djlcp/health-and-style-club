class ServerettingsController < ApplicationController
  def index
    @serversettings = Serversetting.all
  end

  def show
    @serversettings = Serversetting.find(:id)
  end

  def new
  end


  def edit
  end


  def create
  end


  def update

  end


  def destroy
  end

  private

    def set_comment
    end

    def serversettings_params
      params.require(:serversettings).permit(:active, :serversettings_id, :reactivation_date, :task_name)
    end
end
