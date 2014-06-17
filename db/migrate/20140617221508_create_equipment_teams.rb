class CreateEquipmentTeams < ActiveRecord::Migration
  def change
    create_table :equipment_teams do |t|
      t.integer :equipment_id
      t.integer :team_id

      t.timestamps
    end
  end
end
