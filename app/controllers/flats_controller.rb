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
    # @flats = Flat.where.not(latitude: nil, longitude: nil)
    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude,
        infoWindow: { content: render_to_string(partial: "/shared/map_window", locals: { flat: flat }) }
      }
    end
  end

  def show
    @booking = Booking.new
    @flat.reviews
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
    @flat = Flat.find(params[:id])
    if @flat.destroy
      redirect_to my_profile_path
    else
      render :edit
    end
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
