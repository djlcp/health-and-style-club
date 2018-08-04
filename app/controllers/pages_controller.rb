class PagesController < ApplicationController

  def home
    redirect_to admins_root_path if @admin
    redirect_to contributors_root_path if @contributor
    redirect_to members_root_path if not @standard
  end

  def contact
    redirect_to new_contact_path
  end

  def about; end

  def faq; end

  def privacy_policy; end

  def t_c_page; end

  def fitness_and_nutrition
    # TODO: ADD REDIRECT LINK FOR MEMBERS AND ADMINS
  end

  def masterclasses
    # TODO: ADD REDIRECT LINK FOR MEMBERS AND ADMINS
  end

  def personal_development
    # TODO: ADD REDIRECT LINK FOR MEMBERS AND ADMINS
  end
  
  def personal_styling
    # TODO: ADD REDIRECT LINK FOR MEMBERS AND ADMINS
  end


  def members
    # TODO: Re-write code to look for users allowed to show in members page.
    @users =
      User.all
          .joins('LEFT JOIN subscriptions ON subscriptions.user_id = users.id')
          .where('role IN (2,3) AND search_consent = 1 OR subscriptions.paid_for = 1 AND role = 1 AND search_consent = 1')
  end

  def members_profile
    # TODO: Re-write code to display user's profile if user has consent
    @user = User.find(params[:id])
    if @user.search_consent == true && @user.subscription.present? && @user.subscription.paid_for == true || @user.role == 'admin'&& @user.search_consent == true || @user.role == 'contributor' && @user.search_consent == true
      @user = User.find(params[:id])
    elsif @user == current_user
      @user = User.find(params[:id])
    else
      redirect_to members_path, alert: "I'm sorry, this user's information is private."
    end
  end
end