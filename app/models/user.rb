class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :masterclasses
  has_many :posts
  has_one :subscription
  has_many :comments


  mount_uploader :bioavatar, Picture
  mount_uploader :biobackground, Picture

  enum role: { subscriber: 1, contributor: 2, admin: 3}

  after_create :set_role
  after_create :add_user_email

  def full_name
    "#{first_name} #{surname}"
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
