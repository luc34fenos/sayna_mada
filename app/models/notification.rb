class Notification < ApplicationRecord
	validates_presence_of :name
	validates_presence_of :description
	validates_presence_of :target
	validates_presence_of :level

	has_many :checkings, dependent: :destroy
	has_many :users, through: :checkings
end
