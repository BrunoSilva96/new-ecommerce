module UserHelper
  def user_avatar_url(_current_user)
    return current_user.avatar if current_user.avatar.attached?

    'image_profile'
  end
end
