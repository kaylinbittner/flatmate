class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def home
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
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
