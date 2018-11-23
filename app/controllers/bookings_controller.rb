class BookingsController < ApplicationController
  def new
    @flat = Flat.find(params[:flat_id])
    redirect_to flat_bookings_path(@flat)
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat

    if @booking.save
      redirect_to my_profile_path
    else
      redirect_to flat_path(@flat)
    end
  end
  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to my_profile_path
    else
      render :new
    end
  end

  private

  def bookings_params
    # FIXME
    params.require(:booking).permit(:checkin, :checkout, :guests)
  end
end

