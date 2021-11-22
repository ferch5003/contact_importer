class FailedContact < ApplicationRecord
  include CreditCardeable

  belongs_to :user
  belongs_to :contact_file

  validates :errors, presence: true

  before_save :save_credit_card
end
