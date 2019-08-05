class SearchesController < ApplicationController
  def new
    @search = Search.new
    @skills = filtered_skills
  end
  def create
  	p "C"*23
  	@result = []
    who = params[:search][:name][0]
    by = params[:search][:name][1]
    p who
    p by
  	params[:search][:name].each do |value|
      if params[:search][:name].index(value) > 1
        if who == "users"
          if by == "username"
            user = User.find_by(username: value)
          elsif by == "email"
            user = User.find_by(email: value)
          elsif by == "status"
            user = User.find_by(status: value)
          end
          @result << user if !@result.include?(user)
        end

        if who == "students"
          if by == "skills"
            Cv.all.each do |cv|
              @result << cv.student.user if !@result.include?(cv.student.user) && cv.skills.include?(Skill.find_by(name: value))
            end
          elsif by == "languages"
            Cv.all.each do |cv|
              @result << cv.student.user if !@result.include?(cv.student.user) && cv.languages.include?(Language.find_by(name: value))
            end
          elsif by == "programming_languages"
            Cv.all.each do |cv|
              @result << cv.student.user if !@result.include?(cv.student.user) && cv.programming_languages.include?(ProgrammingLanguage.find_by(name: value))
            end
          end
        end

        if who == "companies"
          if by == "area"
            Company.all.each do |company|
              @result << company.user if !@result.include?(company.user) && company.activity_area == value
            end
          elsif by == "city"
            Company.all.each do |company|
              @result << company.user if !@result.include?(company.user) && company.cities.include?(City.find_by(name: value))
            end
          end
        end
      end
    end
  	
  	# session[:search] = @result

  	respond_to do |format|
  		format.html { render template: "searches/create", result: @result }
  		format.js
  	end
  	p "C"*23
  end

  def index
  end

  def show
  end

  private
  def check_student(search)
  	Student.all.each do |student|
  		skill = Skill.find_by(name: search)
  		language = Language.find_by(name: search)
  		if skill && !language
  			@result << student if has_skill(student, skill) && !exist(student)
  		elsif !skill && language
  			@result << student if has_language(student, language) && !exist(student)
  		elsif skill && language
  			@result << student if has_skill(student, skill) && has_language(student, language) && !exist(student)
  		end
  	end
  end
  def find_student_or_company(search)
    user = User.find_by(username: search)        
    if user
      @result << user if !exist(user)
    end
  end
  def exist(student)
  	@result.include?(student)
  end
  def has_skill(student, skill)
  	student.cv.skills.include?(skill)
  end
  def has_language(student, language)
  	student.cv.languages.include?(language)
  end
  def check_company(search)
  	Company.all.each do |company|
  		@result << "#{company.name}" if ( company.name.to_s.include?(search) )
  	end
  end

  def filtered_skills
    skills = []
    Skill.all.each do |skill|
      skills << skill if !skills.include?(skill)
    end
    skills
  end
end
