class DoppelgangersController < ApplicationController
  before_action :set_doppelganger, only: %i[show edit update destroy]

  def index
    @doppelgangers = Doppelganger.all
  end

  def roster
    @roster = Doppelganger.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.new
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
    params.require(:doppelganger).permit(:name, :age, :location, :rate)
  end

  def set_doppelganger
    @doppelganger = Doppelganger.find(params[:id])
  end
end
