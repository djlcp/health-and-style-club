class CollectionsPost < ApplicationRecord
  belongs_to :collection
  acts_as_list scope: :collection
  belongs_to :post
end
