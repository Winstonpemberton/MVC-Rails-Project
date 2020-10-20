class CharactersController < ApplicationController
  def index
    @characters = current_user.characters
  end

  def show
    @character = Character.find(params[:id])
    current_game.set_current_character(@character)
    @game = current_game
  end

  def inventory
    @character = Character.find(params[:id])
    @inventory = @character.inventory
  end

  def new
    @character = Character.new
  end

  def create
    #figure out how to set game id since @game won't work
    @character = Character.create(character_params)
    @character.update(user_id: current_user.id, game_id: @game.id, health: 50)
    if @character.save
      current_game.set_current_character(@character)
      redirect_to @character
    else
      render :new
    end
  end

  def character_info
    @character = current_character
  end

  def character_picture
    @character = Character.find(params[:id])
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    @character.update(character_params)
    current_game.set_current_character(@character)
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
