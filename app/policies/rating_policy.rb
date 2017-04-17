class RatingPolicy < ApplicationPolicy
  
  def upvote?
    @user.permission? :post
  end

  def downvote?
    @user.permission? :post
  end
  
end