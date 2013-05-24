class Energetic
  include Mongoid::Document

  # -Relationships-
  has_many :spots, inverse_of: :energetic, dependent: :restrict
  # has_and_belongs_to_many :news -- mimic

  # -Info-
  field :name, type: String
  field :about, type: String

  # -CarrierWave-
  mount_uploader :avatar, AvatarUploader

  # -Access-
  attr_accessible :name, :about, :avatar, :avatar_cache, as: :admin

  # -Validations-
  validates :name, :avatar, presence: true
  validates :about, length: { maximum: 200 }
end
