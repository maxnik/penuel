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

  protected 

  def downcase_email
    # http://stackoverflow.com/questions/6422211/rails-3-validating-email-uniqueness-and-case-sensitive-fails/6422771#6422771
    self.email = self.email.downcase if self.email.present?
  end

  def set_password
    self.password = self.email
  end
end
