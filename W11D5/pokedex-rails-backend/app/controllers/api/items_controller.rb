class Api::ItemsController < ApplicationController
  def index
    pokemon_id = params[:pokemon_id]
    @items = Item.where(pokemon_id: pokemon_id)
    render "api/items/index"
  end

  def create
  end

  def update
  end

  def destroy
  end

end
