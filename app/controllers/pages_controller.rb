class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def members
    @user = User.all
    @admins = @user.where(role: 'admin', search_consent: 1)
    @contributors = @user.where(role: 'contributor', search_consent: 1)
    @subscribers = @user.joins(:subscription).where({"subscriptions.paid_for" => true}, role: 'subscriber', search_consent: 1)
    @users = @admins + @subscribers + @contributors
  end

  def members_profile
    @user = User.find(params[:id])
  end

  def faq
  end
end
