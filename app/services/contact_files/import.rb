module ContactFiles
  class Import < Base
    def initialize(user_id:, contact_file_id:, filename:, headers: {})
      @current_user = User.find(user_id)
      @contact_file = ContactFile.find(contact_file_id)
      @filename = filename
      @headers = parse_headers(headers)
    end

    def call
      return Response.failure(title: "The file doesn't exist, please try again") unless File.file?(@filename)

      options = {
        key_mapping: @headers
      }
      contacts = SmarterCSV.process(@filename, options)

      persisted_contact = generated_contacts(contacts)

      Response.new(result: persisted_contact)
    rescue StandardError => e
      Response.failure(title: e.message)
    end

    private

    def parse_headers(headers)
      # First symbolize keys
      headers = headers.symbolize_keys

      # Then invert keys/values in order to key_mapping with SmarterCSV
      headers.invert.deep_transform_keys { |key| key.parameterize.underscore.to_sym }
    end

    def generated_contacts(contacts)
      ActiveRecord::Base.transaction do
        contacts = parse_contacts(contacts)

        valid_contacts = []
        invalid_contacts = []

        contacts.each do |contact|
          if contact.valid?
            valid_contacts << contact
          else
            failed_contact = FailedContact.new(contact.attributes)
            failed_contact.error_messages = contact.errors.full_messages
            invalid_contacts << failed_contact
          end
        end

        Contact.bulk_proccess(valid_contacts)
        FailedContact.bulk_proccess(invalid_contacts)

        if valid_contacts.empty? && invalid_contacts.any?
          @contact_file.fail!
        elsif valid_contacts.any?
          @contact_file.finish!
        end

        { valid_contacts: valid_contacts, invalid_contacts: invalid_contacts }
      end
    end

    def parse_contacts(contacts)
      contacts.map do |contact|
        contact[:id] = nil
        contact[:user_id] = @current_user.id
        contact[:contact_file_id] = @contact_file.id

        Contact.new(contact)
      end
    end
  end
end
