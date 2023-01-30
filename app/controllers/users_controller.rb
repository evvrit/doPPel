class UsersController < ApplicationController
  def profile
    @user = current_user
    @doppelganger = Doppelganger.where(user_id: current_user).first
    @something = "something"
    # raise
  end
end
