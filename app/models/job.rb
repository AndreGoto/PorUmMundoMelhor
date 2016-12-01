class Job < ApplicationRecord
  belongs_to :user
  has_many :volunteers
  has_attachments :picture, maximum: 5

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # scope :category, -> (category) { where category: category }
  # scope :address, -> (address) { where address: address }
  # scope :title, -> (title) { where("name like ?", "#{title}%")}

  # this method can be tested on "rails console"
  # def self.search(title,category)
  #   #returns an array from the results
  #   tit = Job.where("title LIKE ?", "%#{title.capitalize}%")
  #   cat = Job.where("category LIKE ?", "%#{category}%")
  #   result_1 = tit.where("category LIKE ?", "%#{category}%")
  #   if result_1
  #     result_1
  #   elsif tit
  #     tit
  #   else
  #     cat
  #   end
  # end
end
