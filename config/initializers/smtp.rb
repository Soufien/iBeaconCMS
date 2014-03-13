=begin  For now we aren't going to use e-mail password recovery
if Rails.env.staging? || Rails.env.production?
  SMTP_SETTINGS = {
    address: ENV.fetch('SMTP_ADDRESS'), # example: 'smtp.sendgrid.net'
    authentication: :plain,
    domain: ENV.fetch('SMTP_DOMAIN'), # example: 'this-app.com'
    password: ENV.fetch('SMTP_PASSWORD'),
    port: '587',
    user_name: ENV.fetch('SMTP_USERNAME')
  }
end
=end
