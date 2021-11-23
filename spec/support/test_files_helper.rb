module TestFilesHelper
  class << self
    def upload(filename: '')
      file = "#{filepath}/#{filename}"
      ActiveStorage::Blob.create_and_upload!(
        io: File.open(file),
        filename: 'contacts_valid_file.csv',
        content_type: 'text/csv'
      ).signed_id
    end

    private

    def filepath
      @filepath ||= "#{::Rails.root}/spec/fixtures"
    end
  end
end
