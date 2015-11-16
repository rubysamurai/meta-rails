module MetaRails
  class Application < Rails::Application
    config.eager_load = false
    config.secret_key_base = 'dummy'
  end
end

MetaRails::Application.initialize!
