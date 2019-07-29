class CoverLettersController < ApplicationController
  before_action :set_cover_letter, only: [:show, :edit, :create, :update, :destroy]
  before_action :set_cv, only: [:show, :edit, :create, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @cover_letter = CoverLetter.new
  end

  def create
  end

  def edit
  end

  def update
    if @cover_letter.update(params.require(:cover_letter).permit(:content))
      respond_to do |format|
        format.html{ redirect_to "/moncv/#{@cv.id}/malm/#{@cover_letter.id}", notice: "Votre lettre de motivation a bien été mise à jour!"}
        format.js
      end
    end
  end

  def destroy
  end

  private
  def set_cover_letter
    @cover_letter = CoverLetter.find(params[:id])
  end
  def set_cv
    @cv = @cover_letter.cv
  end
end
