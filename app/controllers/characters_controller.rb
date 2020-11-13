class CharactersController < ApplicationController

  def equip_weapon
    weapon = Weapon.find(params[:weapon_id])
    character = Character.find(params[:character_id])
    character.weapon = weapon
    redirect_to user_character_path(current_user,character)
  end

  
  def equip_armor
    armor = Armor.find(params[:armor_id])
    character = armor.inventory.character
    character.armor = armor
    redirect_to user_character_path(current_user,character)
  end

  def show
    @character = Character.find(params[:id])
    @game = @character.game
  end

  def new
    @user = current_user
    @character = Character.new
  end

  # def create
  #   @character = Character.create(character_params)
  #   @character.update(user_id: current_user.id, game_id: @game.id, health: 50)
  #   if @character.save
  #     redirect_to @character
  #   else
  #     render :new
  #   end
  # end

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
    redirect_to user_path(current_user)
  end

  private

  # def character_params
  #   params.require(:character).permit(:name, :background)
  # end
end
