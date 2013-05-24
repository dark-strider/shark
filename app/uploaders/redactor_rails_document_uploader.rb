class RedactorRailsDocumentUploader < CarrierWave::Uploader::Base
  include RedactorRails::Backend::CarrierWave

  storage :file

  def store_dir
    "uploads/redactor/document/#{model.id}"
  end

  def extension_white_list
    RedactorRails.document_file_types
  end
end