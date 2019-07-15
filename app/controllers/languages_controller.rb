class LanguagesController < ApplicationController
  def create
    @cv = Cv.find(params[:cv_id])
    @language = Language.new(name: params[:name])
    respond_to do |format|
      if @language.save
      	@cv.languages << @language
        format.js
      else
        format.js
      end
    end
  end
  def update
  	@language = Language.find(params[:id])
    if params[:name]
     @language.update(name: params[:name])
  	else params[:level]
     @language.update(level: params[:level])
    end
  	respond_to do |format|
  		format.js
  	end
  end
  
  def destroy
  	@language = Language.find(params[:id])
  	@language.destroy
  	respond_to do |format|
  		format.js
  	end
  end
end
