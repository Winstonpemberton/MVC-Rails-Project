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
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:notice] = "Game deleted."
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

end
