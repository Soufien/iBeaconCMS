CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => 'AKIAJOGX4M65YABCKOLQ',
      :aws_secret_access_key => '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',
      :region => 'us-west-1',
      # :endpoint => 'https://ibeacon-mondavi.s3-website-us-west-1.amazonaws.com'
  }
  config.fog_directory = 'ibeacon-mondavi' # required
  config.fog_public = true # optional, defaults to true
  config.storage = :fog
end