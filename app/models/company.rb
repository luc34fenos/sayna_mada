class Company < ApplicationRecord
  belongs_to :user
  has_many :staff
  has_and_belongs_to_many :cities
end
