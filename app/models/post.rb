class Post < ApplicationRecord

mount_uploader :image, Picture

  belongs_to :user
  belongs_to :category
  # belongs_to :masterclass
  has_many :comments
  has_many :post_contents, -> { order(order: :asc) }
  has_many :contents, through: :post_contents
end
