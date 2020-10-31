class GamesController < ApplicationController
  before_action :require_login

  def new
    @game = Game.new
    @merchant = Merchant.new 
  end

  def show
    @game = Game.find(params[:id])
    if @game.enemy == nil
      @enemy = Enemy.create(name: "Big Bad Demon", damage: 10, health: 20, game_id: @game.id)
    else 
      @enemy = @game.enemy
    end

    @character = @game.characters.last
  end

  # def battle
  #   @enemy = Enemy.create(name: "Big Bad Demon", damage: 5, health: 20)
  #   @game = Game.find(params[:id])
  # end

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
    enemy = Enemy.find(params[:enemy_id])
    game = enemy.game
    # enemy = Boss.find(params[:boss_id]).present?

    if character
      character.attack(enemy)
      if enemy.health > 0
        redirect_to user_game_path(current_user,character.game)
      end
      if character.health < 0
        render :lose
      end
      if enemy.health < 0
        game.enemy.destroy
        character.update(:gold => (character.gold + 15))
        render :win
      end
    else
      redirect_to user_character_path(current_user, character)
    end
  end

  def create
    @game = Game.create
    # current_user.set_current_game(@game)

    if current_user
      @character = Character.create(character_params)
      @character.update(user_id: current_user.id, game_id: @game.id, health: 50, gold: 5)
      Inventory.create(character_id: @character.id)
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
    params.require(:character).permit(:name, :background)
  end

  def merchant_params
    params.require(:merchant).permit(:name, :background, :gender)
  end

end
