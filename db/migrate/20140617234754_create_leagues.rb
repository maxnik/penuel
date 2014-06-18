class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name_ru
      t.string :name_en
      t.string :championship_page

      t.timestamps
    end
  end
end
