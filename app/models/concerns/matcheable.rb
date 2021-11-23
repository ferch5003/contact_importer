require_relative '../../lib/date_parser'

module Matcheable
  extend ActiveSupport::Concern

  EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  NAME_REGEX = /\A[^-]+\z/
  PHONE_REGEX = /\A\(\+\d{2}\)(\s?\d{3}){2}(\s?\d{2}){3}\z|\A\(\+\d{2}\)(\s?\d{3})(-?\d{3})(-?\d{2}){2}\z/

  DATE_VALID_FORMATS = %w[%F %Y%m%d].freeze

  private

  def iso_8601_valid_format
    valid = DATE_VALID_FORMATS.any? { |format| DateParser.valid_format?(date: date_of_birth_before_type_cast, format: format) }
    raise 'Invalid Format' unless valid
  rescue StandardError
    message = 'Invalid format, please check the ISO 8601 to verify if your format is any of %Y%m%d or %F'
    errors.add(:date_of_birth, message)
  end
end
