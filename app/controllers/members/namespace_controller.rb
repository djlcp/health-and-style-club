module Members
  class NamespaceController < ::ApplicationController
    before_action :authenticate_user!
    before_action :verify_user
    layout 'members/application'
    def verify_user
      redirect_to subscriptions_path, notice: 'You are not premium' if @standard || @contributor
    end
  end
end