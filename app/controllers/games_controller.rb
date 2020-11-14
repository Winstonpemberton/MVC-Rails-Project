class GamesController < ApplicationController
  before_action :require_login

  def new
    @game = Game.new
    @merchant = Merchant.new 
  end

  def show   
    @game = Game.find(params[:id])
    @character = @game.characters.last

    @enemy = @game.determine_enemy(params.values.first)

    # case params.values.first
         
    # when "enemy"  
    #   if @game.enemy == nil
    #     @enemy = Enemy.create(name: "Big Bad Demon", damage: 10, health: 20, game_id: @game.id)
    #   else 
    #     @enemy = @game.enemy
    #   end
    # when "boss"
    #   if @game.boss == nil
    #     @enemy = Boss.create(name: "Big Bad Boss Demon", damage: 30, health: 50, game_id: @game.id)
    #   else 
    #     @enemy = @game.boss
    #   end
    # else
    #   "errrrror"
    # end
    @game = Game.find(params[:id])
    @character = @game.characters.last
  end

  def use_potion
    character = Character.find(params[:character_id])

    enemy = Game.determine_enemy(params[:enemy_class], params[:enemy_id])

    # if params[:enemy_class] == "Enemy"
    #   enemy = Enemy.find(params[:enemy_id])
    # else 
    #   enemy = Boss.find(params[:enemy_id])
    # end

    if character.health > 0 && enemy.health > 0 && enemy.class.name == "Enemy"
      response = character.use_potion
      # character.update(:health => (character.health - (enemy.damage - character.armor.armor_rating)))
      character.update_health(enemy)
      flash[:notice] = response
      redirect_to user_game_path(current_user,character.game, :enemy_type => "enemy")
    elsif character.health > 0 && enemy.health > 0 && enemy.class.name == "Boss"
      response = character.use_potion
      # character.update(:health => (character.health - (enemy.damage - character.armor.armor_rating)))
      character.update_health(enemy)
      flash[:notice] = response
      redirect_to user_game_path(current_user,character.game, :enemy_type => "boss")
    else
      flash[:notice] = "You were defeated, and returned to the character page"
      # character.update(:health => (character.health + 50))
      character.revive
      redirect_to user_character_path(current_user, character)
    end
  end

  # def boss_battle
  #   @enemy = Boss.create(name: "Super Big Bad Demon", damage: 50, health: 60)
  #   @character = current_character
  # end

  def win
  end

  # def lose
  # end

  def update_battle
    character = Character.find(params[:character_id])

    enemy = Game.determine_enemy(params[:enemy_class], params[:enemy_id])
    # if params[:enemy_class] == "Enemy"
    #   enemy = Enemy.find(params[:enemy_id])
    # else 
    #   enemy = Boss.find(params[:enemy_id])
    # end

    game = enemy.game

    if character
      response = character.attack(enemy) 

      if Game.continue_battle?(enemy, character) && enemy.which_enemy?
        #  enemy.health > 0 && character.health > 0 && enemy.class.name == "Boss"
        flash[:notice] = response
        redirect_to user_game_path(current_user,character.game, :enemy_type => "enemy")

      elsif Game.continue_battle?(enemy, character) && enemy.which_enemy?
        # enemy.health > 0 && character.health > 0 && enemy.class.name == "Enemy"
        flash[:notice] = response
        redirect_to user_game_path(current_user,character.game, :enemy_type => "boss")
      end
      if Game.game_beaten?(enemy) 
        # enemy.health < 0 && enemy.class.name == "Boss" 
        game.boss.destroy
        flash[:notice] = "You've beaten the Boss and completed the game"
        redirect_to user_path(current_user)
      end
      if Game.character_defeated?(character, enemy) 
        # character.health < 0 && enemy.health > 0 
        flash[:notice] = "You were defeated, and returned to the character page"
        # character.update(:health => (character.health + 50))
        character.revive
        redirect_to user_character_path(current_user, character)
      end
      if enemy.health < 0 && character.health > 0 && enemy.class.name == "Enemy"
        game.enemy.destroy
        # character.update(:gold => (character.gold + 15))
        character.receive_gold
        flash[:notice] = "Enemy Defeated, 15 gold earned"
        redirect_to user_character_path(current_user, character)
      end
      else
        flash[:notice] = "something went wrong returned to character page"
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
      @merchant = Merchant.create(user_id: current_user.id, game_id: @game.id)
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
