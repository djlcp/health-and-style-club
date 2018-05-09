class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  belongs_to :admin
  has_one :subscription

  enum role: { subscriber: 1, contributor: 2, admin: 3}

end
