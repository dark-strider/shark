class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file

  process resize_to_fit: [1280, 1280]

  version :normal do
    process resize_to_fit: [600, 450]
  end

  version :small, from_version: :normal do
    process resize_to_fit: [72, 54]
  end

  def store_dir
    "uploads/photo/#{model.spot_id}"
  end

  def filename
     "#{secure_token(16)}.#{file.extension}" if original_filename.present?
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

private

  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end
end