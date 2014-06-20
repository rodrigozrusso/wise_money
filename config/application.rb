require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module WiseMoney
  class Application < Rails::Application

    config.encoding = "utf-8"

    config.time_zone = 'Brasilia'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{yml}').to_s]
    config.i18n.default_locale = :'pt-BR'

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.precompile += %w( *.svg *.eot *.woff *.ttf )

  end
end
