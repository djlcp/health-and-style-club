class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_user


  def update
    @user = current_user

    if @user.update_attributes(user_params)
      flash[:notice] = 'Your profile was successfully updated.'
      redirect_to root_path
    else

    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'Your account was successfully deleted.' }
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(
      :id,
      :email,
      :password,
      :password_confirmation,
      :role,
      :bioavatar,
      :biobackground,
      :first_name,
      :surname,
      :phone,
      :search_consent,
      :facebook,
      :twitter,
      :website,
      :youtube,
      :pinterest,
    )
  end
end
