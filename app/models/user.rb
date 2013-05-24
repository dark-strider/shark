class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # -Relationships-
  has_many :checkins, inverse_of: :user
  has_many :spots, inverse_of: :user
  has_many :news, inverse_of: :user
  has_many :photos, inverse_of: :user
  has_many :given_stickers, class_name: 'Sticker', inverse_of: :seller
  has_many :taken_stickers, class_name: 'Sticker', inverse_of: :client

  # -Static-
  ROLES = %w(user seller admin)

  # -Virtual-
  attr_accessor :login

  # -Devise-
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  field :name,                   type: String
  field :email,                  type: String, default:''
  field :encrypted_password,     type: String, default:''
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  field :remember_created_at,    type: Time
  field :sign_in_count,          type: Integer, default:0
  field :current_sign_in_at,     type: Time
  field :last_sign_in_at,        type: Time
  field :current_sign_in_ip,     type: String
  field :last_sign_in_ip,        type: String

  # -CanCan-
  field :role, type: String, default: ROLES.first

  # -CarrierWave-
  mount_uploader :avatar, AvatarUploader

  # -Access-
  attr_accessible :login, :name, :email, :password, :password_confirmation,
                  :remember_me, :avatar, :avatar_cache, as: [:default, :admin]
  attr_accessible :role, as: :admin

  # -Validations-
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { in: 2..15 }
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :role, presence: true,
                   length: { in: 1..6 },
                   inclusion: { in: ROLES }

  # -Actions-
  # function to handle user's login via email or name
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login).downcase
      where(conditions).where('$or' => [{name: /^#{Regexp.escape(login)}$/i}, {email: /^#{Regexp.escape(login)}$/i}]).first
    else
      where(conditions).first
    end
  end
end
