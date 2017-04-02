class Course < ApplicationRecord
  
  validates :code,       presence: true
  validates :title,      presence: true
  validates :days,       presence: true
  validates :start_time, presence: true
  validates :end_time,   presence: true
  
end
