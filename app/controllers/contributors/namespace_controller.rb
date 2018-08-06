module Contributors
  class NamespaceController < ::ApplicationController
    before_action :authenticate_user!
    before_action :verify_user
    layout 'contributors/application'
    def verify_user
      redirect_to members_root_path if @subscriber
      redirect_to subscriptions_path, notice: 'You are not premium' if @standard
    end
  end
end