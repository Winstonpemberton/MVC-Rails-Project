class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login

  def current_user
    if session[:user_id].present?
      user = User.find_by(:id => session[:user_id])
    end
  end

  # def current_game
  #   current_user.set_current_game
  # end

  # def current_character
  #   current_game.set_current_character
  # end

  def require_login
    unless current_user
      redirect_to root_url
    end
  end

end
