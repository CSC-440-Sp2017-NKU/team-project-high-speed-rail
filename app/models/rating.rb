class Rating < ApplicationRecord
  belongs_to :answer
  
  validates_uniqueness_of :user_id, scope: [:question_id]
  
  scope :upvotes, -> { where(is_liked: true) }
  scope :downvotes, -> { where(is_liked: false) }
  
end
