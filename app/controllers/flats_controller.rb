class FlatsController < ApplicationController

before_action :authenticate_user!, only: [:new, :import]

  def index
  	@flats = Flat.all
  end

  def show
  	@vote = params[:v]
  	@flat = Flat.next_flat_for_user(current_user)
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

#  	flash[:error] = 'Ruh roh'
  end

 # def thumbsup
 #  	flat = Flat.find(params[:id])
 #	user.thumbsup.create!(flat: @flat, vote: +1)
 # 	Flat.increment_counter("upvotes", flat.id)
 # 	flash[:info] = 'Votes updated.'
 # 	flat = flat.increment_counter(flat.id)
 # 	return redirect_to show_path
 # end

  def thumbsup
  	flat= Flat.find(params[:id])
  	flat.thumbsup(current_user)
  	return redirect_to root_path
  end

  def nothanks
  	flat= Flat.find(params[:id])
  	flat.killswitch(current_user)
  	return redirect_to root_path
  end


  
  private
  def parameters
  	params.require(:flat).permit(:location, :image, :price, :upvotes)
  end



end
