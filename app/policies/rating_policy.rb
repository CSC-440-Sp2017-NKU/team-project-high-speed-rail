class RatingPolicy < ApplicationPolicy
  
  def upvote?
    @user.permission? :course_manage
  end

  def downvote?
    @user.permission? :course_manage
  end
  
end