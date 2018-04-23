class Post < ApplicationRecord

  belongs_to :user
  # belongs_to :masterclass
  has_many :comments
  has_many :content
end
