class Language < ApplicationRecord
	has_many :cv_languages
	has_many :cvs, through: :cv_languages
end
