class Web < ApplicationRecord
<<<<<<< HEAD
	has_one :cv
	has_one :company
=======
	belongs_to :company
	has_one :cv
  has_one :company
>>>>>>> c7b7c570ece560deeeb57b1c3dcea06dbd7dddb0
end
