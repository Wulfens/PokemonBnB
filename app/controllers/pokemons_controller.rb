class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = Booking.new
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon.new(pokemon_params)
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :price_per_day, :types)
  end
end
