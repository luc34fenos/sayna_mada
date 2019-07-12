class Web < ApplicationRecord
<<<<<<< HEAD
	belongs_to :cv
	belongs_to :company
=======
	has_one :cv
  has_one :company
>>>>>>> 84d1c55c8943f4fc60cfcbfb9a68b5d1883d522b
end
