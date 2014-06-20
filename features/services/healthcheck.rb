module Service
  class Healthcheck

    def healthcheck
      @response = HTTParty.get("#{APP_URL}healthchecks", {})
    end

    def response
      @response.to_json
    end

    def code
      @response.code
    end

  end
end
