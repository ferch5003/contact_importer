class PagesController < ApplicationController
  def index
    redirect_to contacts_path if user_signed_in?
  end
end
