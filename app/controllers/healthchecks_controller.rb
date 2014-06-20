class HealthchecksController < ApplicationController

  def index
    errors, response = {}, {}

    all_healthchecks.each do |healthcheck|
      if healthcheck.alive?
        response[healthcheck.class] = 'OK'
      else
        Rails.logger.error("Healthcheck ALERT: '#{healthcheck.class}' is down!")
        errors[healthcheck.class] = healthcheck.error_message
      end
    end

    if errors.present?
      render json: { errors: errors }, status: :service_unavailable
    else
      render json: { ok: response }, status: :ok
    end
  end

  def all_healthchecks
    @@healthchecks ||= [ Healthchecks::Database.new ]
  end

end
