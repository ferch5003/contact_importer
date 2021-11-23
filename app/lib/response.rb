class Response
  attr_reader :result, :title, :record, :errors, :success
  
  def initialize(result: nil, title: '', record: nil, errors: nil, success: true)
    if record.present? && record.errors.any?
      @result = nil
      @title = 'There is an error, please check it out.'
      @record = record
      @errors = record.errors
      @success = true
    else
      @result = result
      @title = title
      @record = record
      @errors = errors
      @success = success
    end
  end

  class << self
    def failure(title:, errors: nil)
      new(title: title, errors: errors, success: false)
    end
  end

  def failure?
    !@success
  end

  def success?
    @success
  end
end
