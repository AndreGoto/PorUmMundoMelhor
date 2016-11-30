class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers
  has_attachments :picture, maximum: 5
end
