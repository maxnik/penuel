class League < ActiveRecord::Base
  default_scope { order 'name_ru ASC' }

  has_many :leagues_teams, dependent: :destroy
  has_many :teams, through: :leagues_teams

  validates :name_ru, :name_en, presence: true
end
