class Country
  include Mongoid::Document

  # -Relationships-
  has_many :cities, inverse_of: :country, dependent: :restrict

  # -Info-
  field :name, type: String

  # -Access-
  attr_accessible :name, as: :admin

  # -Validations-
  validates :name, presence: true,
                   length: { maximum: 20 }
end