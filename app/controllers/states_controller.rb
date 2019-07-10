class StatesController < ApplicationController
  def index
	@states = CS.states(params[:country])

	  respond_to do |format|
	  	format.js
	  end

	end
end
