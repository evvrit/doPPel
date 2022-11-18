class BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy set_status]
  before_action :set_doppelganger, only: %i[new create]

  def index
    @outgoing_bookings = Booking.where(user_id: current_user.id)
    @incoming_bookings = current_user.agent_bookings
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
      redirect_to bookings_path
    else
      render 'doppelgangers/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def set_status
    case params[:status].to_i
    when 1
      @booking.accepted!
    when 2
      @booking.rejected!
    when 3
      @booking.canceled!
    else
      ""
    end
    redirect_to bookings_path
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
