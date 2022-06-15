module SessionsHelper
  def login(use)
    session[:current_user_id] = user.id
  end

  def logout
    if session[:current_user_id]
      session.delete(user.id)
      @current_user = nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    if session[:current_user_id]
      @current_user ||= User.find_by(id: session[:current_user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
