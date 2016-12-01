class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers
  has_attachments :picture, maximum: 5

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
