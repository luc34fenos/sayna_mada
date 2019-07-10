class Student < ApplicationRecord
	has_and_belongs_to_many :languages
	has_and_belongs_to_many :formations
	has_and_belongs_to_many :skills
	has_and_belongs_to_many :programming_languages
	has_and_belongs_to_many :cover_letters
end
