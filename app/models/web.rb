class Web < ApplicationRecord
	validates_uniqueness_of :name
  	
  	belongs_to :company
end
