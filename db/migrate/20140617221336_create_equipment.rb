class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name_ru
      t.string :name_en
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
