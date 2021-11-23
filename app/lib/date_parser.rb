module DateParser
  class << self
    def valid_format?(date:, format:)
      Date.strptime(date, format)
      true
    rescue StandardError
      false
    end
  end
end
