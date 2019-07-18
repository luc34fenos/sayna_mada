class Web < ApplicationRecord

	belongs_to :company
	has_one :cv
  has_one :company
end
