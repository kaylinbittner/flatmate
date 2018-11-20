class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def home
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params(:id))
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
  end

  private
  def flat_params
    params.require(:flat).permit(:key_description, :description, :price, :city, :zipcode, :street, :country, :average_rating, :wifi, :dishwasher, :allows_pets, :kitchen, :guests, :handicap, :balcony, :smoking, :tv, :availability)
  end
end

