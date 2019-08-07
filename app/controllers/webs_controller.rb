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

    elsif params[:company_id]

    end
    p "C"*60
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
    format.html { redirect_to "/moncv/#{params[:web][:cv_id]}", notice: 'Lien supprimé.' }
    format.js
    format.json { head :no_content }
  end
end


private

  def set_web
    @web = Web.find(params[:id])
  end

def web_paramss
  params.require(:web).permit(:cv_id, :name, :link)
end
def web_paramsc
  params.require(:web).permit(:company_id, :name, :link)
end
end
