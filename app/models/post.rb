class Post < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :user
  # belongs_to :masterclass
  has_many :comments
  has_many :post_contents
  has_many :contents, through: :post_contents


end
