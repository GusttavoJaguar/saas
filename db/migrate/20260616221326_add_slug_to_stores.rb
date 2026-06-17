class AddSlugToStores < ActiveRecord::Migration[8.1]
  def change
    add_column :stores, :slug, :string
    add_index :stores, :slug, unique: true
  end
end
