class CharactersController < ApplicationController

  # creates a association between a character and a weapon
  def equip_weapon
    weapon = Weapon.find(params[:weapon_id])
    character = Character.find(params[:character_id])
    character.weapon = weapon
    redirect_to user_character_path(current_user,character)
  end

  # creates a association between a character and armor 
  def equip_armor
    armor = Armor.find(params[:armor_id])
    character = armor.inventory.character
    character.armor = armor
    redirect_to user_character_path(current_user,character)
  end

  # loads the show page for characters 
  def show
    @character = Character.find(params[:id])
    @game = @character.game
  end

  def all_items
    @items = []
    @character = Character.find(params[:character_id])
    @weapon = @character.weapon 
    @armor = @character.armor 
    @items << @weapon 
    @items << @armor
  end

  # loads the new character page for characters 
  def new
    @user = current_user
    @character = Character.new
  end

  # might use for future development
  # def create
  #   @character = Character.create(character_params)
  #   @character.update(user_id: current_user.id, game_id: @game.id, health: 50)
  #   if @character.save
  #     redirect_to @character
  #   else
  #     render :new
  #   end
  # end

# loads the edit page for updating a character
  def edit
    @user = current_user
    @character = Character.find(params[:id])
  end

# updates character info
  def update
    @character = Character.find(params[:id])
    @character.update(character_params)
    if @character.save
      redirect_to @character
    else
      render :edit
    end
  end
# destroys a character object
  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    flash[:notice] = "Character deleted."
    redirect_to user_path(current_user)
  end

  private
  # might use for future development
  # def character_params
  #   params.require(:character).permit(:name, :background)
  # end
end
