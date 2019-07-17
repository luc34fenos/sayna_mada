class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :student
  # has_one :company

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one :company

  validates :username, uniqueness: {case_sensitive: false}

  def self.find_for_database_authentication(conditions={})
    find_by(username: conditions[:email]) || find_by(email: conditions[:email])
  end

end
