class AnswerPolicy < ApplicationPolicy
  
  def create?
    @user.permission? :post
  end

  def update?
    @user.permission? :post_manage
  end

  def destroy?
    @user.permission? :post_manage
  end
  
end