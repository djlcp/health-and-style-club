class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def members
    @users = User.all
  end

  def members_profile
    @user = User.find(params[:id])
  end

  def faq
  end
end
