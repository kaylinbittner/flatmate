class ReviewsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
