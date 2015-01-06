class FlatsController < ApplicationController

before_action :authenticate_user!, only: [:new, :import]

  def index
  	@flats = Flat.all
  end

  def show
  	@vote = params[:v]
  	@flat = Flat.vote(@vote)
  	@no_results = !@flat
  end

  def new
  	@flat = current_user.flats.new
  end

  def import
  	@flat = current_user.flats.new(parameters)
  	if @flat.valid?
  		@flat.save
  		flash[:info] = 'New flat added'
  		return redirect_to root_path
  	end

  	flash[:error] = 'Ruh roh'
  end

  private
  def parameters
  	params.require(:flat).permit(:location, :image, :price, :upvotes)
  end



end
