class AttachmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

def new
  @content = Content.create
  @content.save
end

end
