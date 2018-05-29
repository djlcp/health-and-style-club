class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :variables
  # protect_from_forgery with: :exception


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

    def index
      @users = User.all
    end





  def show
    @user = User.find(params[:id])
  end
  end
end
