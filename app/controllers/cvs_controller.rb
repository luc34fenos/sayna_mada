class CvsController < ApplicationController
  before_action :set_cv, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student, only: [:edit, :update, :destroy]

  # GET /cvs
  # GET /cvs.json
  def index
    @cvs = Cv.all
  end

  # GET /cvs/1
  # GET /cvs/1.json
  def show
    @student = @cv.student
  end

  # GET /cvs/new
  def new
    @cv = Cv.new
  end

  # GET /cvs/1/edit
  def edit
    @student = @cv.student
  end

  # POST /cvs
  # POST /cvs.json
  def create
    @cv = Cv.new(cv_params)

    respond_to do |format|
      if @cv.save
        format.html { redirect_to @cv, notice: 'Cv was successfully created.' }
        format.json { render :show, status: :created, location: @cv }
      else
        format.html { render :new }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cvs/1
  # PATCH/PUT /cvs/1.json
  def update
    p "U"*70
    p params.inspect
    respond_to do |format|
      if @cv.update(cv_params)
        # add_exp_skill_lg_plg(@cv)
        format.html { redirect_to @cv, notice: 'Cv was successfully updated.' }
        format.json { render :show, status: :ok, location: @cv }
      else
        format.html { render :edit }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
    p "U"*70
  end

  # DELETE /cvs/1
  # DELETE /cvs/1.json
  def destroy
    @cv.destroy
    respond_to do |format|
      format.html { redirect_to cvs_url, notice: 'Cv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cv
      @cv = Cv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cv_params
      params.require(:cv).permit(:hobbies, :summary, :developer_type)
    end

    def experience_params(cv)
      names = params.require(:expnames)
      descriptions = params.require(:expdescriptions)
      names.each do |nk, nv|
        descriptions.each do |dk, dv|
          if nk.slice(-1) == dk.slice(-1) # 0 = 0 / 1 = 1 / ...
            p nv
            p dv
            p Experience.find_by(name: nv) || Experience.find_by(description: dv)

            if Experience.find_by(name: nv) || Experience.find_by(description: dv)
              exp = Experience.find_by(name: nv) ? Experience.find_by(name: nv) : Experience.find_by(description: dv)
              exp.update(name: nv, description: dv)
            else
              exp = Experience.new(name: nv, description: dv)
              exp.cv = cv
            end
            exp.save
            break
          end
        end
      end
    end

    def skill_params
      params.require(:skills)
    end

    def language_params
      params.require(:languages)
    end

    def programming_language_params
      params.require(:programming_languages)
    end

    def add_exp_skill_lg_plg(cv)
      # adding experiences
      experience_params(cv)
    end

    def authenticate_student
      unless current_user.student.cv == Cv.find(params[:id])
        redirect_to "/moncv/#{current_user.student.cv.id}"
      end
    end
end
