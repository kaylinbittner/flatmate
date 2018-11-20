class FlatsController < ApplicationController
  def home
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params(:id))
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user

    if @flat.save
      redirect_to @flat, notice: 'Your flat was successfully created.'
    else
      render :new
    end
  end


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

end

