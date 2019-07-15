class ProgrammingLanguagesController < ApplicationController
  def create
    @cv = Cv.find(params[:cv_id])
    @pl = ProgrammingLanguage.new(name: params[:name])
    respond_to do |format|
      if @pl.save
      	@cv.programming_languages << @pl
        format.js
      else
        format.js
      end
    end
  end
  def update
  	@pl = ProgrammingLanguage.find(params[:id])
    if params[:name]
     @pl.update(name: params[:name])
  	else params[:level]
     @pl.update(level: params[:level])
    end
  	respond_to do |format|
  		format.js
  	end
  end
  
  def destroy
  	@pl = ProgrammingLanguage.find(params[:id])
  	@pl.destroy
  	respond_to do |format|
  		format.js
  	end
  end
end
