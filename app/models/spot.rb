class Spot
  include Mongoid::Document
  include Mongoid::Timestamps

  # -Relationships-
  belongs_to :user, inverse_of: :spots
  belongs_to :energetic, inverse_of: :spots
  has_many :checkins, inverse_of: :spot
  has_many :stickers, inverse_of: :spot
  has_many :photos, inverse_of: :spot

  # -Static-
  STATUS = %w(soon now over)

  # -Info-
  field :status, type: String
  field :code, type: String

  # -Access-
  attr_accessible :energetic_id, :status, :code, as: :admin

  # -Validations-
  validates :user, :energetic, presence: true
  validates :status, presence: true,
                     inclusion: { in: STATUS }
  validates :code, presence: true

  # -Scopes-
  scope :actual, where(:status.in => ['soon', 'now']) # Spot.actual

  # -Maps-
  # .behavior.
  acts_as_gmappable process_geocoding: false

  # .relationship.
  embeds_one :location, inverse_of: :spot, validate: true
  delegate :coordinates, :country, :city, :street, to: :location

  # .access.
  accepts_nested_attributes_for :location
  attr_accessible :location_attributes, as: :admin

  # .actions.
  def longitude
    coordinates[0] if coordinates
  end

  def latitude
    coordinates[1] if coordinates
  end

  # -Actions-
  def checked_by?(current_user)
    check = false
    if current_user && current_user.checkins.any?
      current_user.checkins.each do |checkin|
        if checkin.spot == self
          check = true
          break
        end
      end
    end
    check
  end
end