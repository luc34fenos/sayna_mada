class City < ApplicationRecord
	has_many :students
	# has_many :companies
  has_and_belongs_to_many :companies
end
