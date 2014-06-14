class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.text :description_ru
      t.text :description_en
      t.decimal :amount
      t.integer :user_id
      t.integer :kind, default: 0

      t.timestamps
    end
  end
end
