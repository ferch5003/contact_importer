class User < ApplicationRecord
  include Gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  gravtastic

  validates :email, uniqueness: { case_sensitive: false }
end
