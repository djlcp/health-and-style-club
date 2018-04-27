class Post < ApplicationRecord

mount_uploader :image, ImageUploader

  belongs_to :user
  # belongs_to :masterclass
  has_many :comments
  has_many :content

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
end
