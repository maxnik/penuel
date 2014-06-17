class EquipmentTeam < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :team
end
