class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @contacts = pagy(Contact.all)
  end
end
