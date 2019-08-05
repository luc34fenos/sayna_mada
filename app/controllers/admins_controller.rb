class AdminsController < ApplicationController
	before_action :authenticate_admin

	def search
	end

	private
	def authenticate_admin
		unless user_signed_in && (current_user.status == "admin" || current_user.status == "staff")
			render_404
		end
	end

	def render_404
		respond_to do |format|
			format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
			format.xml  { head :not_found }
			format.any  { head :not_found }
		end
	end
end
