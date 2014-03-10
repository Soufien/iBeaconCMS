require_relative 'production'

Mail.register_interceptor RecipientInterceptor.new(ENV['EMAIL_RECIPIENTS'])

IBeaconCM::Application.configure do
  # ...

  config.action_mailer.default_url_options = { host: 'staging.iBeaconCMS.com' }
end
