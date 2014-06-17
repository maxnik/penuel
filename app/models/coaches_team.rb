class CoachesTeam < ActiveRecord::Base
  belongs_to :coach, class_name: 'User'
  belongs_to :team
end
