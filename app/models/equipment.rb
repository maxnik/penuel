class Equipment < ActiveRecord::Base
  default_scope { order 'name_ru ASC' }

  has_many :equipment_teams, dependent: :destroy
  has_many :teams, through: :equipment_teams

  validates :name_ru, :name_en, :quantity, :price, presence: true
end
