module Members
  class NamespaceController < ::ApplicationController
    before_action :authenticate_user!
    layout 'members/application'
  end
end