# frozen_string_literal: true
module BitAuthenticator
  # Mountable application.
  class Engine < ::Rails::Engine
    isolate_namespace BitAuthenticator

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
