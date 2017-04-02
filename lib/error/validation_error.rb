module Error
  class ValidationError < StandardError
    attr_reader :status, :error, :message

    def initialize(_message = nil, _error = nil)
      @error = _error
      @message = _message || 'model instance validation error!'
      @status = :unprocessable_entity
    end

    def fetch_json
      Helpers::Render.as_json(error, message, status)
    end
  end
end