class BookingsController < ApplicationController
  before_action :set_pokemon, only: :create

  def create
    @booking = Booking.new(booking_params)
    @booking.pokemon = @pokemon
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to pokemons_path
    else
      render "/pokemons/#{@pokemon.id}", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end
end
