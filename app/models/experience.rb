class Experience < ApplicationRecord
  belongs_to :cv

  validates_presence_of :name
  validates :description, length: { maximum: 180, too_long: "%{count} characters is the maximum allowed" }
end
