class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_one :subscription
  has_many :comments

  mount_uploader :bioavatar, Picture
  mount_uploader :biobackground, Picture

  enum role: { subscriber: 1, contributor: 2, admin: 3}

  before_save :strip_urls

  after_create :set_role

  private

  def strip_urls
    if facebook&.match(/www.facebook.com/)
      self.facebook = facebook.split('www.facebook.com')[1]
    end
    if youtube&.match(/www.youtube.com/)
      self.youtube = youutube.split('www.youtube.com')[1]
    end
    if pinterest&.match(/www.pinterest.com/)
      self.pinterest = pinterest.split('www.pinterest.com')[1]
    end
    if twitter&.match(/www.twitter.com/)
      self.twitter = twitter.split('www.twitter.com')[1]
    end
  end

  def set_role
    return if self.role
    self.update_column(:role, 1)
  end

end
