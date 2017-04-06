class Topic < ApplicationRecord
  acts_as_paranoid
  
  has_many :questions
  
  validates :title, presence: true
end
