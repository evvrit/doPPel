class DoppelgangersController < ApplicationController
  before_action :set_doppelganger, only: %i[show edit update destroy]

  def index
    # branch to verify condition if any filters are selected, if none, Doppelganger.all
    # branch query from filters, apply to a Doppelganger.where
    @doppelgangers = Doppelganger.all
    @markers = Doppelganger.geocoded.where("latitude >= 40").map do |doppel|
      {
        lat: doppel.latitude,
        lng: doppel.longitude,
        info_window: render_to_string(partial: "info_window", locals: {doppelganger: doppel})
      }
    end
  end

  def roster
    @roster = Doppelganger.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.new
    @markers = [{
      lat: @doppelganger.latitude,
      lng: @doppelganger.longitude
    }]
  end

  def new
    @doppelganger = Doppelganger.new
  end

  def create
    @doppelganger = Doppelganger.new(doppelganger_params)
    @doppelganger.user = current_user
    if @doppelganger.save
      redirect_to my_roster_path(@doppelganger)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @doppelganger.update(doppelganger_params)
    redirect_to doppelganger_path(@doppelganger)
  end

  def destroy
    @doppelganger.destroy
    redirect_to my_roster_path, status: :see_other
  end

  private

  def doppelganger_params
    params.require(:doppelganger).permit(:name, :age, :address, :rate, :photo, :gender, :bio)
  end

  def set_doppelganger
    @doppelganger = Doppelganger.find(params[:id])
  end
end
