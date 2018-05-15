class DocumentController < ApplicationController
  before_action :authenticate_user!
end
