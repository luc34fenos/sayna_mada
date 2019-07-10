class Cv < ApplicationRecord
	belongs_to :student
	has_many :webs

	has_many :cv_languages
	has_many :languages, through: :cv_languages

	has_many :cv_programming_languages
	has_many :programming_languages, through: :cv_programming_languages

	has_many :cv_skills
	has_many :skills, through: :cv_skills

	has_one :cover_letter
	has_many :backgrounds
end
