class RedactorRailsPictureUploader < CarrierWave::Uploader::Base
  include RedactorRails::Backend::CarrierWave
  include CarrierWave::MiniMagick

  storage :file

  process :read_dimensions

  version :thumb do
    process resize_to_fill: [118, 100]
  end

  version :content do
    process resize_to_limit: [800, 800]
  end

  def store_dir
    "uploads/redactor/picture/#{model.id}"
  end

  # def filename
  #   "something.jpg" if original_filename
  # end

  def extension_white_list
    RedactorRails.image_file_types
  end
end