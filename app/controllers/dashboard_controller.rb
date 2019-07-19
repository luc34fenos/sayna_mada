class DashboardController < ApplicationController
	before_action :authenticate_user!
	#before_action :authenticate_validity, only: [:company_dashboard2, :student_dashboard2]
	before_action :authenticate_company, only: [:company_dashboard1, :company_dashboard2]
	before_action :authenticate_student, only: [:student_dashboard1, :student_dashboard2]

    def show
        @student = Student.find_by(user: current_user)
        @company = Company.find_by(user: current_user)

        if @student
          @cv = @student.cv
        end
    end

		def card
  		@students = Student.all
		end

	# Company
    def company_dashboard1

    end

    def company_dashboard2

    end

	# Student
    def student_dashboard1
    end

    def student_dashboard2
    end
####################
    def concour

    end

    private
    # def authenticate_validity
    # 	user = current_user.student ? current_user.student : current_user.company
    # 	default_url = current_user.student ? student_1_path : company_1_path
    # 	vurl = current_user.student ? student_2_path : company_2_path
    # 	unless current_user.status == "admin" || user.is_activated?
    # 		redirect_to default_url
    # 	end
    # end
    def authenticate_company
    	unless current_user.status == "admin" || current_user.company
    		redirect_to root_path
    	end
    end
    def authenticate_student
    	unless current_user.status == "admin" || current_user.student
    		redirect_to root_path
    	end
    end

end
