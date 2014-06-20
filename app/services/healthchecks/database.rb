module Healthchecks
  class Database
    attr_reader :error_message

    def initialize(model = Capital)
      @model = model
    end

    def alive?
      @model.first
      true
    rescue Exception => e
      @error_message = e.message
      false
    end
  end
end
