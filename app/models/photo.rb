class Photo
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  # -Relationships-
  belongs_to :user, inverse_of: :photos
  belongs_to :spot, inverse_of: :photos

  # -CarrierWave-
  mount_uploader :image, PhotoUploader

  # -Access-
  attr_accessible :user_id, :spot_id, :image, :image_cache, as: :seller

  # -Validations-
  validates :user, :spot, :image, presence: true

  # -Actions-
  # for file-uploader can naming files
  def download(photo_session)
    file_as_string = photo_session.download(path)
    self.image = AppSpecificStringIO.new(path, file_as_string)
  end
end