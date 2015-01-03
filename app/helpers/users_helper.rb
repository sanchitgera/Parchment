module UsersHelper
  def user_is_admin?(user)
    user.role.eql? 'admin'
  end
end
