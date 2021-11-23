class ContactFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @contact_files = pagy(current_user.contact_files.with_attached_file.order(created_at: :desc))
  end

  def create; end
end
