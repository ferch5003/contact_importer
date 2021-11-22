class User < ApplicationRecord
  include Gravtastic

  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  gravtastic

  has_many :contacts
  has_many :contact_files
  has_many :failed_contacts

  validates :email, uniqueness: { case_sensitive: false }
end
