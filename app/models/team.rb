class Team < ActiveRecord::Base
  validates :name_ru, :name_en, presence: true

  has_many :coaches_teams, dependent: :destroy
  has_many :coaches, through: :coaches_teams

  default_scope { order('name_ru ASC') }

  has_many :equipment_teams, dependent: :destroy
  has_many :equipment, through: :equipment_teams

  has_many :leagues_teams, dependent: :destroy
  has_many :leagues, through: :leagues_teams
end
