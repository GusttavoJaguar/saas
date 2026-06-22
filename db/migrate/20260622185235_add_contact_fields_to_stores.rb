class AddContactFieldsToStores < ActiveRecord::Migration[8.1]
  def change
    add_column :stores, :instagram, :string
    add_column :stores, :whatsapp, :string
    add_column :stores, :phone, :string
    add_column :stores, :email, :string
  end
end
