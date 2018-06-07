class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :variables
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #These variables are available in the whole app
  #
  # @signed_in      User signed in?
  # @paid           Subscription paid for?
  # @subscription   User's subscription
  # @sub            Subscription exists?
  #
  def variables

    if user_signed_in?
      @signed_in = true

      if current_user.subscription
        @subscribed = true
        @subscription = current_user.subscription

        if current_user.subscription.paid_for
          @paid = true
        else
          @paid = false
        end
      else
        @subscribed = false
      end


    else

      @signed_in = false

    end
  end
    def index
      @users = User.all
    end





  def show
    @user = User.find(params[:id])
  end

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role, :bioavatar, :biobackground, :first_name, :surname, :phone, :search_consent])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :role, :bioavatar, :biobackground, :first_name, :surname, :phone, :search_consent])

  end
end
