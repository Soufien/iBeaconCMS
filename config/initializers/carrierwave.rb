CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id =>'yyyy',
      :aws_secret_access_key => 'zzzz',
      :region => '',
  }
  config.fog_directory = '' # required
  config.fog_public = true # optional, defaults to true
  config.storage = :fog
end