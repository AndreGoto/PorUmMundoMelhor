class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers

  #this method can be tested on "rails console"
  def self.search(search)
    #returns an array from the results
    Job.where("title LIKE ?", "%#{search.capitalize}%")
  end
end
