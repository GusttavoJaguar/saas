class CreateAvailabilities < ActiveRecord::Migration[8.1]
  def change
    create_table :availabilities do |t|
      t.references :store, null: false, foreign_key: true
      t.integer :weekday
      t.time :start_time
      t.time :end_time
      t.boolean :active

      t.timestamps
    end
  end
end
