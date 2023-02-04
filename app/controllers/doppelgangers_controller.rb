class DoppelgangersController < ApplicationController
  before_action :set_doppelganger, only: %i[show edit update destroy]

  def index
    @doppelgangers = Doppelganger.all
    # @attributes = params.slice("location", "age", "ethnicity", "height", "gender")
    # sql_query = <<~SQL
    #   address @@ ?
    #   AND ethnicity @@ ?
    #   AND gender = ?
    # SQL
    # raise

    # location_query = "address @@ ?"
    # ethnicity_query = "ethnicity @@ ?"
    # gender_query = "gender = ?

    # if @attributes.values.all?("")
    #   @doppelgangers = Doppelganger.all
    # else
    #   @attributes.reject! { |_key, value| value == "" }

    #   p @attributes.map { |key, value| key == :gender ? value.to_i : value }

    #   @doppelgangers = Doppelganger.where(sql_query, attributes[:location], attributes[:ethnicity], attributes[:gender].to_i)
    #   # @doppelgangers = Doppelganger.where(sql_query, attributes[:location])#, attributes[:ethnicity], attributes[:gender].to_i)
    # end

    @markers = Doppelganger.geocoded.map do |doppel|
      {
        lat: doppel.latitude,
        lng: doppel.longitude,
        info_window: render_to_string(partial: "info_window", locals: { doppelganger: doppel })
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
    params.require(:doppelganger).permit(:name, :age, :address, :rate, :photo, :gender, :bio, :ethnicity, :height)
  end

  def set_doppelganger
    @doppelganger = Doppelganger.find(params[:id])
  end
end
