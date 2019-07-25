class WebsController < ApplicationController
  before_action :set_web, only: [:show, :edit, :update , :destroy]


  def index
    @webs = Web.all
  end

  def new
    @web = Web.new
  end

  def create
   @web = Web.new(web_params)
   
   puts params.inspect

         respond_to do |format|
          if @web.save
            format.html { redirect_to @web, notice: 'web was successfully created.' }
            format.js
            format.json { render :show, status: :created, location: @web }
          else
            format.html { render :new }
            format.json { render json: @web.errors, status: :unprocessable_entity }
          end
        end

  end

  def update
		#
    #
    #
  end

  def edit

  end

  def destroy

   @web.destroy
   respond_to do |format|
    format.html { redirect_to root_path, notice: 'web was successfully updated.' }
    format.js
    format.json { head :no_content }
  end
  end


  private

  def set_web
    @web = Web.find(params[:id])
  end

    def web_params
      params.require(:web).permit(:company_id, :name, :link)
    end
end
