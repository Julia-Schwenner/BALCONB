class AddColumnsToBalconies < ActiveRecord::Migration[6.0]
  def change
    add_column :balconies, :address, :text
    add_column :balconies, :description, :text
    add_column :balconies, :price, :integer
  end
end
