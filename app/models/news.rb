class News
  include Mongoid::Document
  include Mongoid::Timestamps

  # -Relationships-
  belongs_to :user, inverse_of: :news
  has_and_belongs_to_many :energetics, inverse_of: nil, validate: false

  # -Static-
  CATEGORIES = %w(news spot)

  # -Info-
  field :category, type: String
  # field :slug, type: String
  field :title, type: String
  field :content, type: String

  # -Access-
  attr_accessible :energetic_ids, :category, :title, :content, as: :admin

  # -Validations-
  validates :user, :energetics, presence: true
  validates :category, presence: true,
                       inclusion: { in: CATEGORIES }
  validates :title, presence: true,
                    length: { maximum: 50 }
  validates :content, presence: true,
                      length: { maximum: 2000 }
end