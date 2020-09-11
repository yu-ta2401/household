class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.integer :price,       null: false
      t.string :width,        null: false
      t.string :depth,        null: false
      t.string :height,        null: false
      t.text :explanation
      t.integer :category_id,   null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
