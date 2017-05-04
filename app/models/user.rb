class User < ApplicationRecord
  require 'csv'
  
  attr_accessor :remember_token
  
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  acts_as_paranoid
  
  has_many :user_permissions
  has_many :permissions, through: :user_permissions
  
  has_many :student_courses
  has_many :enrolled_courses, through: :student_courses, source: :course
  
  has_many :faculty_courses
  has_many :taught_courses, through: :faculty_courses, source: :course
  
  has_many :questions
  has_many :answers
  has_many :ratings
  
  def User.new_student(data)
    user = User.new(data)
    
    user.permissions << Permission.find_permission(:post)
    user.permissions << Permission.find_permission(:student)
    
    user
  end
  
  def User.create_student(data)
    u = User.new_student(data)
    u.save
    u
  end
  
  def User.new_faculty(data)
    user = User.new(data)
    
    user.permissions << Permission.find_permission(:post)
    user.permissions << Permission.find_permission(:topic)
    user.permissions << Permission.find_permission(:faculty)
    
    user
  end
  
  def User.create_faculty(data)
    u = User.new_faculty(data)
    u.save
    u
  end
  
  def User.new_registrar(data)
    user = User.new(data)
    
    user.permissions << Permission.find_permission(:user_manage)
    user.permissions << Permission.find_permission(:course_manage)
    
    user
  end
  
  def User.create_registrar(data)
    u = User.new_registrar(data)
    u.save
    u
  end
  
  def User.new_admin(data)
    user = User.new(data)
    user.permissions << Permission.find_permission(:post)
    user.permissions << Permission.find_permission(:topic)
    user.permissions << Permission.find_permission(:post_manage)
    user.permissions << Permission.find_permission(:topic_manage)
    user.permissions << Permission.find_permission(:course_manage)
    user.permissions << Permission.find_permission(:user_manage)
    user.permissions << Permission.find_permission(:admin)
    
    user
  end
  
  def User.create_admin(data)
    u = User.new_admin(data)
    u.save
    u
  end
  
  def recent_activity
    activity = (self.questions + self.answers).sort{|a,b| b.created_at <=> a.created_at }
    activity[0..9]
  end
  
  def permission?(permission)
    permissions.any? { |p| p.name.underscore.to_sym == permission }
  end
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      user = User.create_student(name: row["name"], email: row["email"],
                  password: row["password"], password_confirmation: row["password"])
      if (user.save)
        User.add_courses_to_user(user, row["courses"])
      end
    end
  end
  
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def upvote_count
    ratings.upvotes.count
  end
  
  def downvote_count
    ratings.downvotes.count
  end
  
  def overall_rating
    upvote_count - downvote_count
  end
  
  private
    
    def self.add_courses_to_user(user, courses)
      courses.split(',').each do |course_code|
        if c = Course.find_by(code: course_code)
          user.enrolled_courses << c
        end
      end
    end
  
end

