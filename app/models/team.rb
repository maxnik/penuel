class Team < ActiveRecord::Base
  validates :name_ru, :name_en, presence: true

  has_many :coaches_teams, dependent: :destroy
  has_many :coaches, through: :coaches_teams

  default_scope { order('name_ru ASC') }
end
