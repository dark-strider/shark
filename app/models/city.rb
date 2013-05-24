class City
  include Mongoid::Document

  # -Relationships-
  belongs_to :country, inverse_of: :cities

  # -Info-
  field :name, type: String

  # -Access-
  attr_accessible :country_id, :name, as: :admin

  # -Validations-
  validates :country, presence: true
  validates :name, presence: true,
                   length: { maximum: 30 }
end