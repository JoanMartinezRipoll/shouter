module CreateShout
  extend AcctiveSupport::Concern

  included do

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
