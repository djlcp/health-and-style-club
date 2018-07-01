class Post < ApplicationRecord
  acts_as_votable
  mount_uploader :image, Picture

  # scope :category, -> (category) { where category_id: category }
  enum category: {
    recipe: 1,
    personal_styling: 2,
    personal_development: 3,
    workout: 4,
    general: 5
  }

  belongs_to :user
  # belongs_to :category
  # belongs_to :masterclass
  has_many :comments
  has_many :collections_posts, -> { order(position: :asc) }, inverse_of: :post
  has_many :collections, through: :collections_posts
end