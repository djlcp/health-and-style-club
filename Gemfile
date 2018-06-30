
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# !!!!!!!!Required Gems!!!!!!!!

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# !!!!!!!!Implemented Gems!!!!!!!!

gem 'toastr-rails'

# Use administrate-field-ckeditor to edit text in admin panel (Implemented by Raymond)
gem "administrate-field-ckeditor", "~> 0.0.9"

# Use administrate for backend admin panel (Implemented by Raymond)
gem "administrate"

# # use administrate-field-carrierwave for uploading images in the admin panel (Implemented by Raymond)
gem 'administrate-field-carrierwave', '~> 0.3.2'


# Use Carrierwave to add images to webapp (Implemented by Raymond)
gem 'carrierwave', '~> 1.0'

gem 'fog-aws'

# Use mini_magick to resize images to webapp (Implemented by Raymond)
gem 'mini_magick', '~> 4.8'

# Use cancancan to manage user permissions (Implemented by Raymond)
gem 'cancancan', '~> 1.13', '>= 1.13.1'

# Use Devise for user authentication (Implemented by Raymond)
gem 'devise', '~> 4.2'


gem 'vimeo'


# Used for generating pdf documents (Implemented by Tiago)

gem 'wicked_pdf'

# Required to use wicked_pdf (Implemented by Tiago)
gem 'wkhtmltopdf-binary'

# Use Cocoon to create nested forms (Implemented by Kristin)
gem 'cocoon'

# Use JQuery-Rails to use JQuery in rails (Implemented by Tiago)
gem 'jquery-rails'

# Use LetterOpener to view mailing actions in development (Implemented by Tiago)
gem 'letter_opener', :group => :development

# Use mail_form to message contact form
gem 'mail_form', '~> 1.5', '>= 1.5.1'

# Use CKEditor to design post conttents easier (Implemented by Liam)
gem 'ckeditor', github: 'galetahub/ckeditor'

gem 'shrine'

gem "font-awesome-rails"

# Use DelayedJob to send massive actions into the background of the app (Implemented by Tiago)
gem 'delayed_job_active_record'

# Use Whenever to provide a clear syntax for writing and deploying cron jobs (Implemented by Tiago)
gem 'whenever', require: false


# Use for post likes
gem 'acts_as_votable', '~> 0.10.0'


gem 'gibbon', '~> 3.2.0'


# !!!!!!!!GROUPS!!!!!!!!

# Use Capistrano for deployment
# gem 'cconfigapistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
   # gem 'pg'
   # ruby '2.5.1'
end

# Used for: Ordering posts in the collections
# An ActiveRecord plugin for managing lists
# https://github.com/swanandp/acts_as_list
gem 'acts_as_list'
