class TopicPolicy < ApplicationPolicy

  def create?
    @user.permission? :topic
  end

  def update?
    @user.permission? :topic_manage
  end

  def destroy?
    @user.permission? :topic_manage
  end
  
end