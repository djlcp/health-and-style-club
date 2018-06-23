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

  def add_user_email
    gibbon = Gibbon::Request.new(api_key: '781defdd2a6930c291fe5b1454133e64-us18')
    gibbon.lists('ba67ca5110').members.create(
    body: {
      email_address: self.email,
      status: 'subscribed',
      merge_fields: { FNAME: self.first_name, LNAME: self.surname }
      }
    )
  end

  def set_role
    return if self.role
    self.update_column(:role, 1)
  end

end
