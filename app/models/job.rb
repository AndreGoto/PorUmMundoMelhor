class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers

  has_attachments :picture, maximum: 5

  #this method can be tested on "rails console"
  def self.search(title,category)
    #returns an array from the results
    tit = Job.where("title LIKE ?", "%#{title.capitalize}%")
    cat = Job.where("category LIKE ?", "%#{category}%")
    result_1 = tit.where("category LIKE ?", "%#{category}%")
    if result_1
      result_1
    elsif tit
      tit
    else
      cat
    end
  end
end
