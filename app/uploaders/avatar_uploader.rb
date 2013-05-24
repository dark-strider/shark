class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file

  process resize_to_fit: [200, 200]

  version :normal do
    process resize_to_fit: [60, 60]
  end

  version :small, from_version: :normal do
    process resize_to_fit: [27, 27]
  end

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end

  def filename
    'avatar.jpg' if original_filename
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def default_url
    asset_path('/assets/avatar/' + [version_name, 'avatar.jpg'].compact.join('_'))
  end
end