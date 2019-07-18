class SkillsController < ApplicationController
	def create
  	@cv = Cv.find(params[:cv_id])
  	if Skill.find_by(name: params[:name])
  		@skill = Skill.find_by(name: params[:name])
  	else
    	@skill = Skill.new(name: params[:name])
  	end
  	
    respond_to do |format|
      if @skill.save
    		@cv.skills << @skill
        format.js
      else
        format.js
      end
    end
  end

  def update
  	@skill = Skill.find(params[:id])
    if params[:name]
     @skill.update(name: params[:name])
  	else
     @skill.update(description: params[:description])
    end
  	respond_to do |format|
  		format.js
  	end
  end
  
  def destroy
  	@skill = Skill.find(params[:id])
  	@skill.destroy
  	respond_to do |format|
  		format.js
  	end
  end
end
