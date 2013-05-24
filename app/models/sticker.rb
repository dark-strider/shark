class Sticker
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  # -Relationships-
  belongs_to :spot, inverse_of: :stickers
  belongs_to :seller, class_name: 'User', inverse_of: :given_stickers
  belongs_to :client, class_name: 'User', inverse_of: :taken_stickers

  # -CarrierWave-
  mount_uploader :avatar, AvatarUploader

  # -Access-
  attr_accessible :spot_id, :seller_id, :client_id, :avatar, :avatar_cache, as: [:seller, :admin]

  # -Validations-
  validates :spot, :seller, :client, presence: true
end