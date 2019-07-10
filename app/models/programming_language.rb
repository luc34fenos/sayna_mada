class ProgrammingLanguage < ApplicationRecord
	has_many :cv_programming_languages
	has_many :cvs, through: :cv_programming_languages
end
