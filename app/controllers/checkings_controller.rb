class CheckingsController < ApplicationController
  def create
  	if params[:check][:one]
      unless params[:check][:all].nil?
        Notification.all.each do |notification|
          Checking.find_by(user: current_user, notification: notification).update(seen: true)
        end
      end
      respond_to do |format|
        format.html{redirect_to "/notifications"}
        format.js
      end
    else
      check_notifications
      unread_notifications
      respond_to do |format|
        format.html{redirect_to "/"}
        format.js
      end
    end
  end
  def update
  	@checking = Checking.find(params[:id])
  	@notification = @checking.notification
  	@checking.update(seen: true)
  	respond_to do |format|
  		format.html { redirect_to "#{@notification.link.to_s}" }
  		format.js
  	end
  end
  
  private
  def unread_notifications
    Notification.all.each do |notification|
	    unless Checking.find_by(user: current_user, notification: notification)
	    	Checking.create(user: current_user, notification: notification)
	    end
    end
  end

  def check_notifications
    Notification.all.each do |notification|
    	notification.destroy if (Time.now - notification.created_at >= 3600*12) # After 12h, remove the notification
    end
  end
end
