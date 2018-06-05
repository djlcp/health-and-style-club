class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def members
    @users = User.all
  end

  def faq
  end
end
