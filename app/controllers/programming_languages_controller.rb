class ProgrammingLanguagesController < ApplicationController
  def create
    @cv = Cv.find(params[:cv_id])
    @programming_language = ProgrammingLanguage.new(name: params[:name])
    respond_to do |format|
      if @programming_language.save
      	@cv.programming_languages << @programming_language
        format.js
      else
        format.js
      end
    end
  end
  def update
  	@programming_language = ProgrammingLanguage.find(params[:id])
    if params[:name]
     @programming_language.update(name: params[:name])
  	else params[:level]
     @programming_language.update(level: params[:level])
    end
  	respond_to do |format|
  		format.js
  	end
  end
  
  def destroy
  	@programming_language = ProgrammingLanguage.find(params[:id])
  	@programming_language.destroy
  	respond_to do |format|
  		format.js
  	end
  end
end