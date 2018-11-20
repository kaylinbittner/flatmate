class FlatsController < ApplicationController
  def home

  end

  def show
    @flat = Flat.find(params(:id))
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @
    else
      render 'new'
    end
  end

  private

  def flat_params
    params.require(:cocktail).permit(:key_description, :description, :price, :city, :zipcode, :street, :country, :average_rating, :wifi, :dishwasher, :allows_pets, :kitchen, :guests, :handicap, :balcony, :smoking, :tv, :availability)
  end

end

