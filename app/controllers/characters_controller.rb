class CharactersController < ApplicationController
  def index

    @characters = current_user.characters
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
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
