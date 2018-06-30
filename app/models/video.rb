class Video < ApplicationRecord
  belongs_to :videoable, polymorphic: true
  acts_as_list scope: :videoable

  scope :welcome_video, -> { where(welcome_video: true) }
  scope :not_welcome_video, -> { where(welcome_video: false) }
end