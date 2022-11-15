class BookingsController < ApplicationController
  before_action :set_doppelganger
  before_action :set_booking

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.doppelganger = @doppelganger
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_doppelganger
    @doppelganger = Doppelganger.find(params[:doppelganger_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :address, :status)
  end
end
