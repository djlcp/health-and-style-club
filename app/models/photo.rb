class Photo < ApplicationRecord
  include ::PhotoUploader::Attachment.new(:image)
end
