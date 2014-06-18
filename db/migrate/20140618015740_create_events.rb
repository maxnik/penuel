class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name_ru
      t.string :name_en
      t.string :result_ru
      t.string :result_en
      t.date :when_date

      t.timestamps
    end
  end
end
