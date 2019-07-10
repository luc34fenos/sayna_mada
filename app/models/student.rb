class Student < ApplicationRecord
  belongs_to :user
  has_one :cv
  belongs_to :city
end
