module UsersHelper
  def follow_button user
    if current_user.following? user
      button_to 'Unfollow', user_follow_path(user), method: :delete
    else
      button_to 'Follow', user_follow_path(user)
    end
  end

  def create_shout(content)
    shout = current_user.shouts.build(content: content)
    shout.save
    if shout.save
      redirect_to dashboard_path
    else
      flash[:alert] = "Could not shout"
      redirect_to dashboard_path
    end
  end
end
