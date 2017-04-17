class UserPolicy < ApplicationPolicy
  
  def create?
    @user.permission? :user_manage
  end

  def update?
    @user.permission? :user_manage
  end

  def destroy?
    @user.permission? :user_manage
  end
  
end