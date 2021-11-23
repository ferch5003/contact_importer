class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @contacts = pagy(current_user.contacts.order(created_at: :desc))
  end
end
