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

    if @language.update(level: params[:level])
      respond_to do |format|
        format.js
      end
    end
    
  end
  
  def destroy
    @cv = Cv.find(params[:cv_id])
    @language = Language.find(params[:id])

    languages = @cv.languages

    languages.delete(@language)

    @language.destroy
    
    respond_to do |format|
      format.js
    end
  end
end
