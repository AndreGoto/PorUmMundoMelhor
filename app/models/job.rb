class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers

  #this method can be tested on "rails console"
  def self.search(title,category)
    #returns an array from the results
    cat = Job.where("category LIKE ?", "%#{category}%")
    tit = Job.where("title LIKE ?", "%#{title.capitalize}%")

    result_1 = tit.where("category LIKE ?", "%#{category}%")
    if result_1
      return result_1
    else
      return cat
    end
  end
end
