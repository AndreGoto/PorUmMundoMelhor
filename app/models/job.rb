class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers

  def self.search(search)
    Job.where("name LIKE ?", "%#{search}%")
  end
end
