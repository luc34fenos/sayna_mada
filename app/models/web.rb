class Web < ApplicationRecord
<<<<<<< HEAD
	has_one :cv
	has_one :company
=======

	belongs_to :company
	has_one :cv
  has_one :company
>>>>>>> bed684a9d2a51a38113b8c3f7329f4f4455693a0
end
