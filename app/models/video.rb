class Video < ApplicationRecord
belongs_to :masterclass

scope :welcome_video, -> { where(welcome_video: true) }
scope :not_welcome_video, -> { where(welcome_video: false) }

  # validate :only_one_welcome_video
  #
  # def only_one_welcome_video
  #   return unless masterclass.videos.any? { |video| video.welcome_video? }
  #   errors.add(:base, 'Only one video can be the welcome video')
  # end

  after_create :modify_link

  def modify_link
    first_half, second_half = link.split('https://')
    modified_link = "https://player.#{second_half}"
    update_column(:link, modified_link)
  end


end
