class Checkin
  include Mongoid::Document
  include Mongoid::Timestamps

  # -Relationships-
  belongs_to :user, inverse_of: :checkins
  belongs_to :spot, inverse_of: :checkins
  has_and_belongs_to_many :socials, inverse_of: nil, validate: false

  # -Access-
  attr_accessible :user_id, :spot_id, :social_ids, as: :admin

  # -Validations-
  validates :user, :spot, presence: true
end