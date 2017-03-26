class Permission < ApplicationRecord
  has_many :user_permissions
  has_many :users, through: :user_permissions
  
  validates :name, presence: true, uniqueness: true
  
  def Permission.find_permission(perm)
    perm_string = perm.to_s
    Permission.find_by_name(perm_string)
  end
end
