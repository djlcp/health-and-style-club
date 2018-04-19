class Post < ApplicationRecord

  belongs_to :user
  # belongs_to :masterclass
  has_many :comments
end
