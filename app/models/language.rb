class Language < ApplicationRecord
	has_and_belongs_to_many :cvs
	validates_uniqueness_of :name
end
