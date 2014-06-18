class CreateTeamsUsers < ActiveRecord::Migration
  def up
    drop_table :coaches_teams

    create_table :teams_users do |t|
      t.integer :user_id
      t.integer :team_id

      t.timestamps
    end
  end

  def down
    drop_table :teams_users

    create_table :coaches_teams do |t|
      t.integer :coach_id
      t.integer :team_id

      t.timestamps
    end
  end 
end
