class Page
  include Mongoid::Document

  # -Info-
  field :title, type: String
  field :permalink, type: String
  field :content, type: String

  # -Access-
  attr_accessible :title, :permalink, :content, as: :admin

  # -Validations-
  validates :title, presence: true,
                    length: { maximum: 35 }
  validates :permalink, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { maximum: 35 }
  validates :content, presence: true,
                      length: { maximum: 9000 }

  # -Actions-
  # def to_param
  #   permalink
  # end
end