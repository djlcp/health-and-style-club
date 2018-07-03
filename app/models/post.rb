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

  enum sub_category: {
      breakfast: 1,
      lunch: 2,
      dinner: 3,
      snack: 4,
      desert: 5
  }

  belongs_to :user
  has_many :comments
  has_many :collections_posts, -> { order(position: :asc) }, inverse_of: :post
  has_many :collections, through: :collections_posts

  scope :free, -> { where(paid_for: false) }
  scope :paid, -> { where(paid_for: false) }


  def breakfast
    @breakfast = @recipies.select("sub_category, 1")
  end
end
