module Admins
  class NamespaceController < ::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    layout 'admins/application'

    private

    def authenticate_admin
      return if current_user.admin?
      redirect_to members_root_path
    end
  end
end