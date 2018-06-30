class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :collections
  has_many :masterclasses
  has_many :posts
  has_one :subscription
  has_many :users_collections

  mount_uploader :bioavatar, Picture
  mount_uploader :biobackground, Picture

  enum role: { subscriber: 1, contributor: 2, admin: 3}

  before_save :strip_urls

  after_create :set_role
  after_create :add_user_email

  def full_name
	  "#{first_name} #{surname}"
  end

  private

  def strip_urls
    if facebook&.match(/www.facebook.com/)
      self.facebook = facebook.split('www.facebook.com')[1]
    end
    if youtube&.match(/www.youtube.com/)
      self.youtube = youtube.split('www.youtube.com')[1]
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

  def add_user_email
    begin
      gibbon = Gibbon::Request.new(api_key: '781defdd2a6930c291fe5b1454133e64-us18')
      gibbon.lists('ba67ca5110').members.create(
        body: {
          email_address: email,
          status: 'subscribed',
          merge_fields: { FNAME: first_name, LNAME: surname }
        }
      )
    rescue
      return
    end
  end

  def set_role
    return if role
    update_column(:role, 1)
  end
end
