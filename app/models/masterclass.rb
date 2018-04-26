class Masterclass < ApplicationRecord
  has_many :videos
  has_many :events
  has_many :documents

  accepts_nested_attributes_for :videos
  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :documents
end
