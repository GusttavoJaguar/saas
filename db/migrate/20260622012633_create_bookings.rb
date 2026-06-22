class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :store, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :scheduled_at
      t.text :notes
      t.string :status

      t.timestamps
    end
  end
end
