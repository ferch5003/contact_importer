module ContactFiles
  class Create < Base
    def initialize(file:, user_id:)
      @file = file
      @current_user = User.find(user_id)
    end

    def call
      return Response.failure(title: "The file doesn't exist, please try again") unless File.exist?(@file)

      raise 'Invalid quantity of columns, please give a proper CSV file' unless valid_headers_qty?

      contact_file = @current_user.contact_files.create!(file: @file)

      Response.new(result: contact_file)
    rescue StandardError => e
      Response.failure(title: e.message)
    end

    private

    def valid_headers_qty?
      original_contact_headers = CSV.read(@file, headers: true).headers
      original_contact_headers.length >= 6
    end
  end
end
