class AddTextColorsToStores < ActiveRecord::Migration[8.1]
  def change
    add_column :stores, :primary_text_color, :string
    add_column :stores, :secondary_text_color, :string
  end
end
