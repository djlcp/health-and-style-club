class Post < ApplicationRecord
  acts_as_votable
  mount_uploader :image, Picture

  scope :category, -> (category) { where category_id: category }

  belongs_to :user
  belongs_to :category
  # belongs_to :masterclass
  has_many :comments

end