class Rating < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  
  validates_uniqueness_of :user_id, scope: [:answer_id]
  
  scope :upvotes, -> { where(is_liked: true) }
  scope :downvotes, -> { where(is_liked: false) }
  
end
