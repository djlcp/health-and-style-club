class User < ApplicationRecord

  # Added by ChargebeeRails.
  has_one :subscription
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  enum role: { subscriber: 1, contributor: 2, admin: 3}

end
