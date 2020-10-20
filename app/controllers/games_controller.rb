class GamesController < ApplicationController
  before_action :require_login

  def new
    @game = Game.new
    @merchant = Merchant.new 
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
    character = Character.find(params[:character_id])
    if character
      character.use_potion
    else
      redirect_to battle_path
    end
  end

  def boss_battle
    @enemy = Boss.create(name: "Super Big Bad Demon", damage: 50, health: 60)
    @character = current_character
  end

  def win
  end

  def lose
  end

  def update_battle
    character = Character.find(params[:character_id])
    enemy = Enemy.find(params[:enemy_id]).present?
    enemy = Boss.find(params[:boss_id]).present?

    if character
      character.attack(enemy)
      if enemy.health > 0
        redirect_to battle_path
      end
      if character.health < 0
        redirect_to lose_path
      end
      if enemy.name == "Super Big Bad Demon" || enemy.health == 0
        redirect_to win_path
      end
    else
      redirect_to user_character_path(current_character)
    end
  end

  def create
    @game = Game.create
    # current_user.set_current_game(@game)

    if current_user
      @character = Character.create(character_params)
      @character.update(user_id: current_user.id, game_id: @game.id, health: 50)
      Inventory.create(character_id: @character.id)
      @game.set_current_character(@character)
      @merchant = Merchant.create(game_id: @game.id)
      @merchant.update(merchant_params)
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
    params.require(:character).permit(character:[:name], character:[:background])
  end

  def merchant_params
    params.require(:merchant).permit(merchant:[:name], merchant:[:background], merchant:[:gender])
  end

end
