require 'fog/aws'
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    region: 'eu-west-2',
    :path_style            => true,
    aws_access_key_id: 'AKIAJIWOsdfD5OQ',
    aws_secret_access_key: 'bUP1RmsfAMJRmXi5mdsx'
  }
  config.fog_directory = 'healthstyleclub'
  config.fog_public = true
  
end
