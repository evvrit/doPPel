class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]
  before_action :set_doppelganger, only: [:new, :create]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.doppelganger = @doppelganger
    @booking.user = current_user
    @booking.status = 0
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_doppelganger
    @doppelganger = Doppelganger.find(params[:doppelganger_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :address, :status, :doppelganger_id, :user_id)
  end

end
