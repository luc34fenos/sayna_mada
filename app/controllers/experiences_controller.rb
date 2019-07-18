class ExperiencesController < ApplicationController
  def create
    @cv = Cv.find(params[:cv_id])
    @experience = Experience.new(name: params[:name])
    @experience.cv = @cv
    respond_to do |format|
      if @experience.save
        format.js
      else
        format.js
      end
    end
  end
  def update
  	@exp = Experience.find(params[:id])
    if params[:name] 
     @exp.update(name: params[:name])
  	else
     @exp.update(description: params[:description])
    end
  	respond_to do |format|
  		format.js
  	end
  end
  
  def destroy
  	@exp = Experience.find(params[:id])
  	@exp.destroy
  	respond_to do |format|
  		format.js
  	end
  end
end
