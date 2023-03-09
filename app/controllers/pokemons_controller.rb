class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show edit update destroy]
  def index
    @pokemons = policy_scope(Pokemon)
    @markers = @pokemons.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @booking = Booking.new
    authorize @pokemon
  end

  def new
    @pokemon = Pokemon.new
    authorize @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user = current_user
    authorize @pokemon
    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def edit
    authorize @pokemon
  end

  def update
    authorize @pokemon
    if @pokemon.update(pokemon_params)
      redirect_to pokemon_path(@pokemon)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @pokemon
    @pokemon.destroy
    redirect_to pokemons_path, status: :see_other
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :price_per_day, :photo, :poster_url, types: [])
  end
end
