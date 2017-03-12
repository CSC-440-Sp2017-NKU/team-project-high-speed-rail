class Rating < ApplicationRecord
  belongs_to :answer
  
  scope :upvotes, -> { where(is_liked: true) }
  scope :downvotes, -> { where(is_liked: false) }
  
end
