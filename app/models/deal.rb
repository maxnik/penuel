class Deal < ActiveRecord::Base
  enum kind: [:expense, :income]

  belongs_to :user

  validates :amount, :description_ru, :user_id, presence: true

  def self.kinds_select
    self.kinds.keys.map { |kind| [I18n.t("kind_#{kind}"), kind] }
  end
end
