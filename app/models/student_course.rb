class StudentCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  
  validates_uniqueness_of :user_id, :scope => [:course_id]
end
