class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def home
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
<<<<<<< HEAD

    if @flat.save
      redirect_to @flat, notice: 'Your flat was successfully created.'
=======
    if @flat.save!
      redirect_to @flat
>>>>>>> 629e631d084e1f037df0a61bf7d1d416cacae8ae
    else
      render :new
    end
  end

<<<<<<< HEAD

# <<<<<<< HEAD
#   def create
#     @flat = Flat.new(flat_params)
#     if @flat.save
#       redirect_to @
#     else
#       render 'new'
# =======
#   def new
#     @flat = Flat.new
#   end

#   def create
#     @flat = Flat.new(flat_params)
#     if @flat.save
#       redirect_to @flat
#     else
#       render :new
# >>>>>>> 2dd96f64a8960289b8a397641bac28ae0932d5d6
#     end

def update
  if false #@flat.update(flat_params)
    redirect_to @flat, notice: 'The flat was successfully updated.'
  else
    render :edit
  end
end


private

def flat_params
  params.require(:flat).permit(:key_description, :description, :price, :city, :zipcode, :street, :country, :average_rating, :wifi, :dishwasher, :allows_pets, :kitchen, :guests, :handicap, :balcony, :smoking, :tv, :availability, {pictures: []})
end

=======
  private
  def flat_params
    params.require(:flat).permit(:description, :price, :city, :zipcode, :street, :country, :average_rating, :wifi, :dishwasher, :allows_pets, :kitchen, :guests, :handicap, :balcony, :smoking, :tv, :availability, {pictures: []})
  end
>>>>>>> 629e631d084e1f037df0a61bf7d1d416cacae8ae
end
