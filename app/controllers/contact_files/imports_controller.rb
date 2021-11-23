class ContactFiles::ImportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact_file, only: %i[new create]

  def new
    @headers = CSV.parse(@contact_file.file.download, headers: true).headers
  end

  def create
    ImportContactsCsvJob.perform_later(user_id: current_user.id,contact_file_id: @contact_file.id, headers: import_params)
    redirect_to contact_files_path, notice: 'File is already in proccess, please wait a moment'
  end

  private

  def set_contact_file
    @contact_file = current_user.contact_files.find(params[:contact_file_id])
  end

  def import_params
    params.require(:import).permit(:name, :email, :telephone, :address, :date_of_birth, :credit_card)
  end 
end
