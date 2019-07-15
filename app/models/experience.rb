class Experience < ApplicationRecord
  belongs_to :cv

  validates_presence_of :name
end
