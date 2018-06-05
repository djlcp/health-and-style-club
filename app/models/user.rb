class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_one :subscription
  has_many :comments

  mount_uploader :bioavatar, Picture

  enum role: { subscriber: 1, contributor: 2, admin: 3}

  after_create :set_role

  def set_role
    return if self.role
    self.update_column(:role, 1)
  end

end
