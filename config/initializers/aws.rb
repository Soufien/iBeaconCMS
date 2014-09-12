require 'aws-sdk'
aws_file = Rails.root.join('config', 'aws.yml')
AWS_CONFIG = YAML.load(File.read(aws_file))[Rails.env]

if ENV['AWS_ACCESS_KEY_ID'].present?
  AWS_CONFIG['access_key_id'] = ENV['AWS_ACCESS_KEY_ID']
end

if ENV['AWS_SECRET_KEY'].present?
  AWS_CONFIG['secret_access_key'] = ENV['AWS_SECRET_KEY']
end

if ENV['PARAM1'].present?
  AWS_CONFIG['region'] = ENV['PARAM1']
end

if ENV['PARAM2'].present?
  AWS_CONFIG['bucket'] = ENV['PARAM2']
end