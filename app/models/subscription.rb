class Subscription < ApplicationRecord
belongs_to :user, optional: true

end
