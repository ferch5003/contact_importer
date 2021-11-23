class ContactFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @contact_files = pagy(current_user.contact_files.with_attached_file.order(created_at: :desc))
    @contact_file = ContactFile.new
  end

  def create
    if params[:contact_file].present?
      response = ContactFiles::Create.call(file: contact_file_params[:file], user_id: current_user.id)
      if response.success?
        redirect_to new_contact_file_import_path(response.result), notice: 'File uploaded successfully!'
      else
        redirect_to contact_files_path, alert: response.title
      end
    else
      redirect_to contact_files_path, alert: 'Missing file, please try again'
    end
  end

  private

  def contact_file_params
    params.require(:contact_file).permit(:file)
  end 
end
