CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    :aws_access_key_id      => ENV['aws_access_key_id'],
    :aws_secret_access_key => ENV['aws_secret_access_key'],
    region: 'eu-west-2'
  }
  config.fog_directory = 'healthstyleclub'
  config.fog_public = false
end
