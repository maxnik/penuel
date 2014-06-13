class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name_ru
      t.string :name_en
      t.string :locale, default: 'ru'
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
