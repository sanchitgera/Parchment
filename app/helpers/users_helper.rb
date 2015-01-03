module UsersHelper
  def user_is_admin?(user)
    user.has_role? :admin
  end
end
