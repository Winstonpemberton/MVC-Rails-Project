class CharactersController < ApplicationController
  # def index
  #   @characters = current_user.characters
  # end

  def equip_weapon
    weapon = Weapon.find(params[:weapon_id])
    character = Character.find(params[:character_id])
    character.weapon = weapon
    redirect_to user_character_path(current_user,character)

  end

  
  def equip_armor
    armor = Armor.find(params[:armor_id])
    character = Armor.inventory.character
    character.armor = armor
    redirect_to user_character_path(current_user,character)
    
  end

  def show
    @character = Character.find(params[:id])
    # current_game.set_current_character(@character)
    @game = @character.game
  end

  def inventory
    @character = Character.find(params[:id])
    @inventory = @character.inventory
  end

  def new
    @user = current_user
    @character = Character.new
  end

  def create
    #figure out how to set game id since @game won't work
    @character = Character.create(character_params)
    @character.update(user_id: current_user.id, game_id: @game.id, health: 50)
    if @character.save
      # current_game.set_current_character(@character)
      redirect_to @character
    else
      render :new
    end
  end

  def character_info
    @character = Character.find(params[:id])
  end

  def character_picture
    @character = Character.find(params[:id])
  end

  def edit
    @user = current_user
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    @character.update(character_params)
    if @character.save
      redirect_to @character
    else
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    flash[:notice] = "Character deleted."
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :background)
  end
end
