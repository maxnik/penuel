class Team < ActiveRecord::Base
  validates :name_ru, :name_en, presence: true

  has_many :teams_users, dependent: :destroy
  has_many :users, through: :teams_users

  default_scope { order('name_ru ASC') }

  has_many :equipment_teams, dependent: :destroy
  has_many :equipment, through: :equipment_teams

  has_many :leagues_teams, dependent: :destroy
  has_many :leagues, through: :leagues_teams

  has_many :events_teams, dependent: :destroy
  has_many :teams, through: :events_teams
end
