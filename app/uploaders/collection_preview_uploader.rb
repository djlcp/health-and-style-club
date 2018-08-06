class CollectionPreviewUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog

  # def store_dir
  #   #{}"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #   "uploads/"
  # end

  # def filename_thumbnail
  #   filename.chomp(File.extname(filename)) + '.jpg' if original_filename
  # end

  # version :thumb do
  #   process :resize_to_limit => [260, 192]
  #   process :convert => :jpg
  #   process :set_content_type
  # end
  #

  # def set_content_type_jpg(*args)
  #   self.file.instance_variable_set(:@content_type, "image/jpg")
  # end

  # def set_content_type_pdf(*args)
  #   self.file.instance_variable_set(:@content_type, "application/pdf")
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #  process resize_to: [200, 200]
  #end

  # version :preview do
  #   process :covert_to_image(300, 200)
  #   process :convert => :jpg
  #
  #   def convert_to_image(height, width)
  #     image = ::Magick::Image.read(current_path + "[0]")[0]
  #     image.resize_to_fit(height,width).write(current_path)
  #   end
  #
  #   def full_filename (for_file = model.source.file)
  #     super.chomp(File.extname(super)) + '.jpg'
  #   end
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
