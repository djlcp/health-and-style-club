class ApplicationController < ActionController::Base

  before_action :variables
  protect_from_forgery with: :exception

  def variables

# IF SIGNED IN
    if user_signed_in?
      @signed_in = true

# IF OWNS SUBSCRIPTION
      if current_user.subscription
        @sub = current_user.subscription

# IF SUBSCRIPTION PAID_FOR
        if current_user.subscription.paid_for
          @paid = true
        end

      else
# IF NO SUBSCRIPTION EXISTS OR UNPAID
        @sub = false
        @paid = false
      end


# IF NOT SIGNED IN
    else

      @signed_in = false

    end






  end
end