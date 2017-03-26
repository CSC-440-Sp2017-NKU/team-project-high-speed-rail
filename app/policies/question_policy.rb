class QuestionPolicy < ApplicationPolicy

  def index?
    true
  end
  
  def show?
    true
  end

  def create?
    raise Pundit::NotAuthorizedError, "must be logged in" unless @user
    @user.permission? :post
  end
  
  def update?
    raise Pundit::NotAuthorizedError, "must be logged in" unless @user
    @user.permission? :post_manage
  end
  
  def destroy?
    raise Pundit::NotAuthorizedError, "must be logged in" unless @user
    @user.permission? :post_manage
  end

end