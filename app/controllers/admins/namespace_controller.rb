module Admins
  class NamespaceController < ::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    layout 'admins/application'

    private

    def authenticate_admin
      redirect_to members_root_path if @subscriber
      redirect_to contributors_root_path if @contributor
    end
  end
end