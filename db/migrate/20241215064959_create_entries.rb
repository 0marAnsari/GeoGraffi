class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true, null: false
      t.string :image_url, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
