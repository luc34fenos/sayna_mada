class NotificationsController < InheritedResources::Base
  before_action :authenticate_user!
	before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    if current_user.status == "admin" || current_user.status == "staff"
      @notifications = Notification.all.sort_by { |obj| obj.created_at }.reverse
    elsif current_user.student
      @notifications = []
      Notification.all.each do |notification|
        @notifications << notification if notification.target == "all" || notification.target == "students"
      end
      @notifications = @notifications.sort_by { |obj| obj.created_at }.reverse
    elsif current_user.company
      @notifications = []
      Notification.all.each do |notification|
        @notifications << notification if notification.target == "all" || notification.target == "companies"
      end
      @notifications = @notifications.sort_by { |obj| obj.created_at }.reverse  
    end
    # @notifications = unreaded_notifications
    respond_to do |format|
      format.html {render template: "/notifications/index"}
      format.js
    end
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        create_checkings(@notification)
        # Checking.create(user: current_user, notification: @notification)
        format.html { redirect_to @notification, notice: 'notification was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to root_path, notice: 'Mon notification a bien été mis à jour.' }
        format.json { render :show, status: :ok, location: @notification }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:name, :link, :target, :level, :description)
    end

    def unreaded_notifications
    	notifications = []
    	Notification.all.each do |notification|
    		notifications << notification if !notification.users.include?(current_user) || !notification.checkings.find_by(user: current_user).seen
    	end
    	notifications
    end

    def create_checkings(notification)
      User.all.each do |user|
        unless Checking.find_by(user: user, notification: notification)
          Checking.create(user: user, notification: notification)
        end
      end
    end
end

