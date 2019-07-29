class BackgroundsController < ApplicationController
  def create
    @cv = Cv.find(params[:cv_id])
    @background = Background.new(name: params[:name], description: params[:description], start_date: params[:start_date], end_date: params[:end_date])
    @background.cv = @cv
    respond_to do |format|
      if @background.save
        format.js
      else
        format.js
      end
    end
  end
  
  def update
  	@background = Background.find(params[:id])
    if params[:name] 
	    @background.update(name: params[:name])
	  else
	    @background.update(description: params[:description])
	  end
	  respond_to do |format|
    	format.js
	  end
	end

	def destroy
	 	@background = Background.find(params[:id])
	 	@background.destroy
	 	respond_to do |format|
	  	format.js
		end
	end
end
