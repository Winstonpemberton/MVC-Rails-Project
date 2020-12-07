class GamesController < ApplicationController
  before_action :require_login

  # loads the page to create a new game, character and merchant 
  def new
    @game = Game.new
    @merchant = Merchant.new 
    @character = Character.new
  end

  # loads the show page for games 
  def show   
    @game = Game.find(params[:id])
    @character = @game.characters.last
    @enemy = @game.determine_enemy(params.values.first)
    @game = Game.find(params[:id])
    @character = @game.characters.last

  end

  # runs the heal method to give a character more health durring a battle
  def use_potion
    character = Character.find(params[:character_id])
    enemy = Game.determine_enemy(params[:enemy_class], params[:enemy_id])

    # if the battle is still going on and it's against an "enemy" type, it loads back into the battle  
    if Game.continue_battle?(enemy, character) && enemy.class.name == "Enemy"
      response = character.use_potion
      character.update_health(enemy)
      flash[:notice] = response
      redirect_to user_game_path(current_user,character.game, :enemy_type => "enemy")

    # if the battle is still going on and it's against an "boss" type, it loads back into the battle  
    elsif Game.continue_battle?(enemy, character) && enemy.class.name == "Boss"
      response = character.use_potion
      character.update_health(enemy)
      flash[:notice] = response
      redirect_to user_game_path(current_user,character.game, :enemy_type => "boss")
      
    else
      # if the player is killed during a heal attempt, they load back into the character screen
      flash[:notice] = "You were defeated, and returned to the character page"
      character.revive
      redirect_to user_character_path(current_user, character)
    end
  end


  def update_battle

    character = Character.find(params[:character_id])
    enemy = Game.determine_enemy(params[:enemy_class], params[:enemy_id])
    game = enemy.game

    if character
      response = character.attack(enemy) 

      if Game.continue_battle?(enemy, character) && enemy.class.name == "Enemy"
        flash[:notice] = response
        redirect_to user_game_path(current_user,character.game, :enemy_type => "enemy")

      elsif Game.continue_battle?(enemy, character) && enemy.class.name == "Boss"
        flash[:notice] = response
        redirect_to user_game_path(current_user,character.game, :enemy_type => "boss")

      elsif Game.game_beaten?(enemy) 
        game.boss.destroy
        flash[:notice] = "You've beaten the Boss and completed the game"
        redirect_to user_path(current_user)

      elsif Game.character_defeated?(character, enemy) 
        flash[:notice] = "You were defeated, and returned to the character page"
        character.revive
        redirect_to user_character_path(current_user, character)

      elsif Game.enemy_defeated?(character, enemy) && enemy.which_enemy?
        game.enemy.destroy
        character.receive_gold
        flash[:notice] = "Enemy Defeated, 15 gold earned"
        redirect_to user_character_path(current_user, character)

      else
        flash[:notice] = "something went wrong returned to character page"
        redirect_to user_character_path(current_user, character)
      end
    end
  end

  # creates a game, merchant and character because it would be very tedious to go to three different creates at creation 
  def create
    @game = Game.create
    @character = Character.create(character_params)
    @character.update(user_id: current_user.id, game_id: @game.id, health: 50, gold: 5)
    @merchant = Merchant.create(user_id: current_user.id, game_id: @game.id)
    @merchant.update(merchant_params)

    if @character.valid? && @merchant.valid?
      Inventory.create(character_id: @character.id)
      @merchant.build_merchant
      redirect_to @character
    else
      render :new
    end
  end

  # destorys a game obejct 
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
