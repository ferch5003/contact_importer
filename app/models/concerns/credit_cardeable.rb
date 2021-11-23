require 'credit_card_validations/string'
require_relative '../../lib/encryptation'

module CreditCardeable
  extend ActiveSupport::Concern

  private

  def save_credit_card
    self.card_last_digits = credit_card[-4..]
    self.franchise = credit_card.credit_card_brand_name || 'Unknown'
    self.credit_card = Encryptation.sha256(base: credit_card)
  end
end
