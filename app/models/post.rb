class Post < ApplicationRecord

mount_uploader :image, ImageUploader

  belongs_to :user
  # belongs_to :masterclass
  has_many :comments
  has_many :content

end
