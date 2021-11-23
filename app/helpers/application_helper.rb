module ApplicationHelper
  include Pagy::Frontend

  def show_credit_card_hint(last_digits:)
    "••••••••••#{last_digits}"
  end
end
