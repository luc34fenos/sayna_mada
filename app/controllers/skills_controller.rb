class SkillsController < ApplicationController
	def create
  	@cv = Cv.find(params[:cv_id])

    @skill = Skill.new(name: params[:name])
  	
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
    @cv = Cv.find(params[:cv_id])
  	@skill = Skill.find(params[:id])

    skills = @cv.skills

  	skills.delete(@skill)

    @skill.destroy
    
  	respond_to do |format|
  		format.js
  	end
  end
end
