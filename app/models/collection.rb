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
    personal_styling: 1,
    personal_development: 2,
    workout: 3
  }

  # --------------------------------------------------------------------
  # Associations
  # --------------------------------------------------------------------
  belongs_to :user
  has_many :videos, -> { order(position: :asc) }, as: :videoable, dependent: :destroy, inverse_of: :videoable
  has_many :users_collections

  # --------------------------------------------------------------------
  # Validations
  # --------------------------------------------------------------------
  validates(
    :name,
    :collection_type,
    :description,
    presence: true
  )

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
