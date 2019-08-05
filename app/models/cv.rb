class Cv < ApplicationRecord
	belongs_to :student
	
	has_many :swebs

	has_and_belongs_to_many :languages

	has_and_belongs_to_many :programming_languages

	has_and_belongs_to_many :skills

	has_one :cover_letter
	has_one :motivational_video

	has_many :backgrounds
	has_many :experiences
end
