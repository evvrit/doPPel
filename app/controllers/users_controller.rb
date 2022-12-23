class UsersController < ApplicationController
  def profile
    @user = current_user
    @doppelganger = Doppelganger.new
  end
end
