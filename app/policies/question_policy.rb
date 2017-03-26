class QuestionPolicy < ApplicationPolicy

  def index?
    true
  end
  
  def show?
    true
  end

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