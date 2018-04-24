class PostContent < ApplicationRecord
  belongs_to: post 
  has_many: contents
end
