CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    :aws_access_key_id      => ENV['S3_ACCESS_KEY_ID'],
    region: 'eu-west-2'
  }
  config.fog_directory = 'healthstyleclub'
  config.fog_public = false
end

# require 'carrierwave/processing/MiniMagick'
