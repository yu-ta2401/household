class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.integer :price,       null: false
      t.numeric :width,        null: false
      t.numeric :depth,        null: false
      t.numeric :height,        null: false
      t.text :explanation
      t.integer :category_id,   null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
