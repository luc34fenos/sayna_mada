class SwebsController < ApplicationController
	before_action :set_web, only: [:update, :destroy]

	def create
		@sweb = Sweb.new(sweb_paramss)

		respond_to do |format|
			if @sweb.save
				format.html { redirect_to "/moncv/#{params[:sweb][:cv_id]}", notice: 'Le nouveau lien a bien été ajouté' }
				format.js
				format.json { render :show, status: :created, location: @sweb }
			else
				format.html { redirect_to "/moncv/#{params[:sweb][:cv_id]}/edit", alert: 'Le lien existe déjà.' }
				format.json { render json: @sweb.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
	end

	def destroy
		@sweb.destroy
	   respond_to do |format|
	    format.html { redirect_to "/moncv/#{params[:sweb][:cv_id]}", notice: 'Lien supprimé.' }
	    format.js
	    format.json { head :no_content }
	  end
	end

	private
	def set_web
		@sweb = Sweb.find(params[:id])
	end
	def sweb_paramss
		params.require(:sweb).permit(:cv_id, :name, :link)
	end
end
