class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
