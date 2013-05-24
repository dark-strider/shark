class Location
  include Mongoid::Document

  # -Relationships-
  embedded_in :spot, inverse_of: :location

  # -Info-
  field :coordinates, type: Array
  field :country, type: String
  field :city, type: String
  field :street, type: String

  # -Access-
  attr_accessible :coordinates, :country, :city, :street, as: :admin

  # -Validations-
  validates :coordinates, presence: true
  validates :country, presence: true,
                      length: { maximum: 30 }
  validates :city, presence: true,
                   length: { maximum: 30 }
  validates :street, presence: true,
                     length: { maximum: 70 }
end