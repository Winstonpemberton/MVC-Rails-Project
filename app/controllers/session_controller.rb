class SessionController < ApplicationController
  def new
  end

  # used to do a amniauth login
  def amniauth_create
    user = User.find_or_create_by(:provider => auth_hash[:provider], :uid => auth_hash[:uid]) do |user|
      user.name = auth_hash[:info][:name]
    end

      session[:user_id] = user.id
      redirect_to user_path(user)
  end

  # creates a new seesion to keep the user logged in between pages
  def create
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  # logs the user out 
  def destroy
    if current_user
      session.delete :user_id
      redirect_to root_url
    end
  end

  private 
  def auth_hash
    request.env["amniauth.auth"]
  end
end
