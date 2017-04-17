class Question < ApplicationRecord
    belongs_to :user
    belongs_to :topic

    has_many :answers, dependent: :destroy
    
    default_scope -> { order(created_at: :desc) }
    
    validates :title, presence: true, length: {maximum: 140}
    validates :content, presence: true
    validates :user, presence: true
    
end
