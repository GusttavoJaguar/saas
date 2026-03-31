class CreateStores < ActiveRecord::Migration[8.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :primary_color
      t.string :secondary_color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
