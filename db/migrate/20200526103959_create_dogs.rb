class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :address
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
