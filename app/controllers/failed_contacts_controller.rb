class FailedContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @failed_contacts = pagy(current_user.failed_contacts.order(created_at: :desc))
  end
end
