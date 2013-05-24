class Social
  include Mongoid::Document

  # -Relationships-
  # has_and_belongs_to_many :checkins -- mimic

  # -Info-
  field :name, type: String
  field :provider, type: String

  # -Access-
  attr_accessible :name, :provider, as: :admin

  # -Validations-
  validates :name, presence: true,
                   length: { maximum: 15 }
  validates :provider, presence: true,
                       length: { maximum: 15 }
end