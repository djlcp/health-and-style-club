class Collection < ApplicationRecord
  # --------------------------------------------------------------------
  # Includes & Extensions
  # --------------------------------------------------------------------

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
  has_many :collections_posts, -> { order(position: :asc) }, inverse_of: :collection
  has_many :posts, through: :collections_posts

  # --------------------------------------------------------------------
  # Validations
  # --------------------------------------------------------------------
  validates(
    :name,
    :collection_type,
    presence: true
  )

  validate :number_of_stages

  def number_of_stages
    # Need to use size instead of count because count doesn't include
    # records held in memory
    return if collections_posts.size >= 2
    errors.add(:base, 'a collection must have at least two stages')
  end

  # --------------------------------------------------------------------
  # Callbacks
  # --------------------------------------------------------------------

  # --------------------------------------------------------------------
  # Nested Attributes
  # --------------------------------------------------------------------
  accepts_nested_attributes_for :collections_posts, allow_destroy: true, :reject_if => :all_blank

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
