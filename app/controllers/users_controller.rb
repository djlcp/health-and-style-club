class UsersController < Devise::RegistrationsController
  before_action :authenticate_user!
  load_and_authorize_resource
  attr_accessor :user
  before_action :user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @user = (params[:id]) ? User.find_by_id(params[:id]) : @current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.valid_password?(params[:password])

      if @user.update_attributes(user_params)

        sign_in(@user, :bypass => true) if @user == current_user
        redirect_to @user, :flash => { :success => 'User was successfully updated.' }
      end
    end


    render :action => 'edit', :anchor => '123456'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
  end

  private
    def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :role, :bioavatar, :biobackground, :first_name, :surname, :phone, :search_consent)
    end
end
