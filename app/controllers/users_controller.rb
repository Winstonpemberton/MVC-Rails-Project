class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  # loads the user signup page 
  def new
    @user = User.new
  end

  # creates a new user object 
  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  # loads the update user page 
  def edit
    @user = User.find(params[:id])
  end

  # updates user info 
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # loads the page with scope methods 
  def scope_test
  end

  # loads the user page 
  def show 
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
