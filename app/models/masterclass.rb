class Masterclass < ApplicationRecord
  mount_uploader :preview, PreviewUploader
  has_many :videos, -> { order(position: :asc) }, as: :videoable, dependent: :destroy, inverse_of: :videoable
  has_many :events
  has_many :documents
  # has_many :comments
  belongs_to :user

  accepts_nested_attributes_for :videos, allow_destroy: true, :reject_if => :all_blank
  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :documents
end
