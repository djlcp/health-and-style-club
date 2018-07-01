class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def members
	  @users =
		  User.all
			  .joins('LEFT JOIN subscriptions ON subscriptions.user_id = users.id')
			  .where('role IN (2,3) AND search_consent = 1 OR subscriptions.paid_for = 1 AND role = 1 AND search_consent = 1')
  end

  def members_profile
	  @user = User.find(params[:id])



	  if @user.search_consent == true && @user.subscription.present? && @user.subscription.paid_for == true || @user.role == 'admin'&& @user.search_consent == true || @user.role == 'contributor' && @user.search_consent == true
		  @user = User.find(params[:id])
	  elsif @user == current_user
		  @user = User.find(params[:id])
	  else
		  redirect_to members_path, alert: "I'm sorry, this user's information is private."
	  end
  end

  def faq
  end
end
