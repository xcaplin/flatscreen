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
  		flash[:info] = 'New flats added'
  		return redirect_to root_path
  	end

  	flash[:error] = 'Ruh roh'
  end

  def thumbsup
  	flat = Flat.find(params[:id])
  	user.votes.create!(flat: @flat, vote: 1)
 # 	Flat.increment_counter("upvotes", flat.id)
  	flash[:info] = 'Votes updated.'
  	return redirect_to show_path
  end

  def nothanks
  	flat = Flat.find(params[:id])
  	user.votes.create!(flat: @flat, vote: 0)
#  	Flat.increment_counter("killswitch", flat.id)
  	flash[:info] = 'Nothanks'
	return redirect_to show_path
    end




  private
  def parameters
  	params.require(:flat).permit(:location, :image, :price, :upvotes)
  end



end
