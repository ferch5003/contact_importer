class Contact < ApplicationRecord
  include CreditCardeable
  include Matcheable

  belongs_to :user
  belongs_to :contact_file

  validates :name, presence: true, format: { with: NAME_REGEX }
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :telephone, presence: true, format: { with: PHONE_REGEX }
  validates :address, presence: true
  validates :credit_card, presence: true, credit_card_number: true
  validates :date_of_birth, presence: true
  validate :iso_8601_valid_format

  before_save :save_credit_card
end
