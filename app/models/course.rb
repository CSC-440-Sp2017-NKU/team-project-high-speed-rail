class Course < ApplicationRecord
  
  has_many :student_courses
  has_many :students, through: :student_courses, source: :user
  
  has_many :faculty_courses
  has_many :faculty, through: :faculty_courses, source: :user
  
  validates :code,       presence: true
  validates :title,      presence: true
  validates :days,       presence: true
  validates :start_time, presence: true
  validates :end_time,   presence: true
  
end
