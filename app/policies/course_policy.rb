class CoursePolicy < ApplicationPolicy
  
  def create?
    @user.permission? :course_manage
  end

  def update?
    @user.permission? :course_manage
  end

  def destroy?
    @user.permission? :course_manage
  end
  
end