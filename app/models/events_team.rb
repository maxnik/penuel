class EventsTeam < ActiveRecord::Base
  belongs_to :event
  belongs_to :team
end
