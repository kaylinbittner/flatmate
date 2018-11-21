class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def home
    @flats = Flat.all
  end

  def index
    @flats = if params[:city]
       Flat.where('city LIKE ?', "%#{params[:city]}%")
     else
       Flat.all
     end
    #flats = Flat.where.not(latitude: nil, longitude: nil)
    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }
    end
  end

  def show
    @booking = Booking.new
    # booking_ids = []
    # Booking.where(flat_id: params[:id]).each do |booking|
    # booking_ids << booking.id
    # end
    # @relevant_reviews = []
    # booking_ids.each do |id|
    #   @relevant_reviews << Review.where(booking_id: id)
    # end

    # @flat = Flat.find(params[:id])
    # @bookings = @flat.bookings
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to @flat
    else
      render :new
    end
  end

  def edit
    puts "hello from edit"
  end

  def update
    @flat.update(flat_params)
    redirect_to @flat
  end

  def destroy
    @flat.destroy
  end

  private

# <<<<<<< HEAD
# =======
#   def set_flat
#     @flat = Flat.find(params[:id])
#   end

# >>>>>>> 4a7a3013187c4f535c1cbe7c737d738d1b724817
def flat_params
  params.require(:flat).permit(:key_description, :description, :price, :city, :zipcode, :street, :country, :average_rating, :wifi, :dishwasher, :allows_pets, :kitchen, :guests, :handicap, :balcony, :smoking, :tv, :availability, {pictures: []})
end

def set_flat
  @flat = Flat.find(params[:id])
end

# =======
#   private
#   def flat_params
#     params.require(:flat).permit(:description, :price, :city, :zipcode, :street, :country, :average_rating, :wifi, :dishwasher, :allows_pets, :kitchen, :guests, :handicap, :balcony, :smoking, :tv, :availability, {pictures: []})
#   end
# >>>>>>> 629e631d084e1f037df0a61bf7d1d416cacae8ae
end
