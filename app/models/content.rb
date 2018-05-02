class Content < ApplicationRecord
  enum content_type: { text: 1, video: 2, image: 3, file: 4 }
  has_many :post_contents
  has_many :posts, through: :post_contents
end
