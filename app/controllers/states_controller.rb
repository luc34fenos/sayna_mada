class StatesController < ApplicationController
  def index
  	p "State"*30
  	puts params.inspect
		@states = CS.states(params[:country])
		p @states.inspect
	  respond_to do |format|
	  	format.js
	  end
  	p "State"*30
	end
end
