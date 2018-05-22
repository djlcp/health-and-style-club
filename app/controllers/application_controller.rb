class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  end
