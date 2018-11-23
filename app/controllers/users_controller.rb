class UsersController < ApplicationController
  def my_profile
    @user = current_user
    @user_bookings = current_user.bookings if current_user.bookings.exists?
    @user_flats = current_user.flats
    @flats = Flat.all
    @users = User.all
  end
end
