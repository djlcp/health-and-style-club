class Collection < ApplicationRecord
  # --------------------------------------------------------------------
  # Includes & Extensions
  # --------------------------------------------------------------------
  mount_uploader :preview, CollectionPreviewUploader

  # --------------------------------------------------------------------
  # Constants
  # --------------------------------------------------------------------

  # --------------------------------------------------------------------
  # Attributes
  # --------------------------------------------------------------------
  enum collection_type: {
    workout: 1,
    recipe: 2,
    personal_styling: 3,
    personal_development: 4
  }

  # --------------------------------------------------------------------
  # Associations
  # --------------------------------------------------------------------
  belongs_to :user
  # The inverse of is really important to allow us to create the association and
  # the collection at the same time
  # has_many :collections_posts, -> { order(position: :asc) }, inverse_of: :collection
  # has_many :posts, through: :collections_posts
  has_many :videos, -> { order(position: :asc) }, as: :videoable, dependent: :destroy

  # --------------------------------------------------------------------
  # Validations
  # --------------------------------------------------------------------
  validates(
    :name,
    :collection_type,
    :description,
    presence: true
  )

  validate :number_of_videos

  def number_of_videos
    # Need to use size instead of count because count doesn't include
    # records held in memory
    return if videos.size >= 2
    errors.add(:base, 'a collection must have at least two videos')
  end

  # --------------------------------------------------------------------
  # Callbacks
  # --------------------------------------------------------------------

  # --------------------------------------------------------------------
  # Nested Attributes
  # --------------------------------------------------------------------
  accepts_nested_attributes_for :videos, allow_destroy: true, :reject_if => :all_blank

  # --------------------------------------------------------------------
  # Scopes
  # --------------------------------------------------------------------

  # --------------------------------------------------------------------
  # Other
  # --------------------------------------------------------------------

  # --------------------------------------------------------------------
  # Class Methods
  # --------------------------------------------------------------------

  # --------------------------------------------------------------------
  # Instance Methods
  # --------------------------------------------------------------------
end
