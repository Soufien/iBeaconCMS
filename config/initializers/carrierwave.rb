CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',                                        # required
      aws_access_key_id: AWS_CONFIG['access_key_id'],         # required
      aws_secret_access_key: AWS_CONFIG['secret_access_key'],  # required
      region: AWS_CONFIG['region']
  }
  config.fog_directory  = AWS_CONFIG['bucket']

  # config.max_file_size = 5.gigabytes #
  config.fog_public = true # optional, defaults to true
  config.storage = :fog
end