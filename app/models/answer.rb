class Answer < ApplicationRecord
  belongs_to :question
  has_many :ratings
  
  validates :content, presence: true
  default_scope -> { order(created_at: :asc) }
  
  def upvote_count
    ratings.upvotes.count
  end
  
  def downvote_count
    ratings.downvotes.count
  end
  
  def overall_rating
    upvote_count - downvote_count
  end
  
end
