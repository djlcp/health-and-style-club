CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJPHLLT6BAE3XEJJA',
    aws_secret_access_key: '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',
    region: 'eu-west-2'
  }
  config.fog_directory = 'healthstyleclub'
  config.fog_public = false
end

# require 'carrierwave/processing/MiniMagick'
