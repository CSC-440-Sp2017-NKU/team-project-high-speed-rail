class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  
  has_many :ratings, dependent: :destroy
  
  validates :content, presence: true
  validates :user, presence: true
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
