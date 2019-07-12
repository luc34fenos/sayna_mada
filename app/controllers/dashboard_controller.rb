class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :formulaire, only: [:company_dashboard2, :student_dashboard2]
	before_action :authenticate_company, only: [:company_dashboard1, :company_dashboard2]
	before_action :authenticate_student, only: [:student_dashboard1, :student_dashboard2]

	# Company
    def company_dashboard1

    end

    def company_dashboard2

    end

	# Student
    def student_dashboard1
    	@student = Student.find_by(user: current_user)
    	@cv = @student.cv
    end

    def student_dashboard2

    end

    private 
    def formulaire
    	user = current_user.student ? current_user.student : current_user.company
    	default_url = current_user.student ? student_1_path : company_1_path
    	vurl = current_user.student ? student_2_path : company_2_path
    	unless user.is_activated?
    		redirect_to default_url,
    		alert: "You're clever but, I'm more!"
    	end
    end
    def authenticate_company
    	unless current_user.company
    		redirect_to root_path,
    		alert: "Bien essayer petit malin"
    	end
    end
    def authenticate_student
    	unless current_user.student
    		redirect_to root_path,
    		alert: "Bien essayer petit malin"
    	end
    end

end
