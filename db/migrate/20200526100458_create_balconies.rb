class CreateBalconies < ActiveRecord::Migration[6.0]
  def change
    create_table :balconies do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
