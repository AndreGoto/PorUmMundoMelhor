class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers
end
