class ImportContactsCsvJob < ApplicationJob
  queue_as :lower_priority

  def perform(user_id:, contact_file_id:, headers:)
    puts '[ImportBooksCsvJob::started]'

    contact_file = ContactFile.find(contact_file_id)

    contact_file.proccess!

    Tempfile.create('a') do |tmp_csv|
      tmp_csv.write(contact_file.file.download)
      tmp_csv.rewind

      begin
        response = ContactFiles::Import.call(user_id: user_id, contact_file_id: contact_file_id, filename: tmp_csv.path, headers: headers)

        raise response.title unless response.success?
      rescue StandardError => e
        puts '[ImportBooksCsvJob::failed]'

        puts e.message
      end
    end
  end
end
