class User < ActiveRecord::Base
  enum role: [:player, :admin, :coach, :sponsor]

  has_secure_password validations: false

  before_validation :downcase_email, :set_password

  validates :email, :name_ru, :name_en, :locale, presence: true
  validates :email, :name_ru, :name_en, length: { maximum: 75 }
  validates :email, uniqueness: true
  validates :locale, inclusion: { in: proc { I18n.available_locales.map { |l| l.to_s } } }

  def self.locales_select
    I18n.available_locales.map do |locale|
      [I18n.t("locale_#{locale}"), locale]
    end
  end

  def self.roles_select
    self.roles.keys.inject([]) do |items, role|
      items << [I18n.t("role_#{role}"), role] unless role == 'admin'
      items
    end
  end

  before_create { generate_token(:remember_token) }
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while self.class.exists?(column => self[column])
  end

  has_many :deals, dependent: :nullify

  has_many :teams_users, dependent: :destroy
  has_many :teams, through: :teams_users

  scope :coaches, -> { where(role: User.roles[:coach]) }
  scope :players, -> { where(role: User.roles[:player]) }

  default_scope { order('name_ru') }

  protected 

  def downcase_email
    # http://stackoverflow.com/questions/6422211/rails-3-validating-email-uniqueness-and-case-sensitive-fails/6422771#6422771
    self.email = self.email.downcase if self.email.present?
  end

  def set_password
    self.password = self.email
  end
end
