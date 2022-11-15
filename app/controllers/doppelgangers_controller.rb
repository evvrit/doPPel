class DoppelgangersController < ApplicationController
  before_action :set_doppelganger, only: %i[show edit update destroy]

  def index
    @doppelgangers = Doppelganger.all
  end

  def show
  end

  def new
    @doppelganger = Doppelganger.new
  end

  def create
    raise
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def doppelganger_params

  end

  def set_doppelganger
    @doppelganger = Doppelganger.find(params[:id])
  end
end
