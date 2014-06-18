class Event < ActiveRecord::Base
  scope :archived, -> { where("when_date < ?", Date.today).order('when_date DESC') }
  scope :current, -> { where("when_date >= ?", Date.today).order('when_date ASC') }

  has_many :events_teams, dependent: :destroy
  has_many :teams, through: :events_teams

  validates :name_ru, presence: true

  def archived?
    when_date < Date.today
  end 
end
