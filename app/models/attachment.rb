class Attachment < ApplicationRecord
  belongs_to :post
  belongs_to :content
end
