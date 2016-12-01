class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers
  has_attachments :picture, maximum: 5
  validates :title, :address, :short_description, :description, :category, :date, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
