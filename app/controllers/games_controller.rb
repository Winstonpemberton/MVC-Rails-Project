class GamesController < ApplicationController
  before_action :require_login

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
    current_user.set_current_game(@game)
  end

  def battle
    @enemy = Enemy.create(name: "Big Bad Demon", damage: 5, health: 20)
    @character = current_character
  end

  def use_potion

  end

  def boss_battle
    @game = Game.find(params[:id])
    @boss = Boss.find(1)
  end

  def win
  end

  def lose
  end

  def update_battle
    character = Character.find(params[:character_id])
    enemy = Enemy.find(params[:enemy_id])

    if character
      response = character.attack(enemy)
      flash[:notice] = response
      redirect_to user_character_path(current_character)
    else
      redirect_to merchant_path(@merchant)
    end
  end

  def create
    @game = Game.create
    current_user.set_current_game(@game)

    if current_user
      @character = Character.create(user_id: current_user.id, game_id: @game.id,health: 50, character_params)
      Inventory.create(character_id: @character.id)
      @game.set_current_character(@character)
      @merchant = Merchant.create( game_id: @game.id, merchant_params)
      @merchant.build_merchant
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
