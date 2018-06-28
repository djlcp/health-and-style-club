require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hsclub
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      if html_tag =~ /<(input|textarea|select)/
        html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
        html_field.children.add_class 'field_with_error'
        html_field.to_s.html_safe
      elsif html_tag =~ /<(label)/
        html_field = Nokogiri::HTML::DocumentFragment.parse(html_tag)
        html_field.children.add_class 'field_with_error_label'
        html_field.to_s.html_safe
      else
        html_tag
      end
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
