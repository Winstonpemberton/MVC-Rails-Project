class GamesController < ApplicationController
  before_action :require_login

  def new
    @game = Game.new
  end

  def battle
    @game = Game.find(params[:id])
  end

  def update_battle

  end

  def create
    @game = Game.create

    if current_user
      @character = Character.create(user_id: current_user.id, game_id: @game.id, character_params)
      @merchant = Merchant.create( game_id: @game.id, merchant_params)
      @merchant.assign_wares
      redirect_to @character
    else
      render :new
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:notice] = "Game deleted."
    redirect_to user_path
  end

  private

  def character_params
    params.require(:character).permit(:merchant_name, :merchant_background)
  end

  def merchant_params
    params.require(:merchant).permit(:character_name, :character_background)
  end

end
