class Api::PokemonController < ApplicationController
  def types
    render json: Pokemon::TYPES    
  end

  def index
    @pokemons = Pokemon.all
    render "api/pokemon/index"
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    # p @pokemon
    # render json: @pokemon
    render "api/pokemon/show"
  end
end