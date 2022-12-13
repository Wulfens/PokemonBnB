class BookingsController < ApplicationController
  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking = Booking.new
  end

  def create
  end
end
