class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :key_description
      t.text :description
      t.string :price
      t.string :city
      t.string :zipcode
      t.string :street
      t.string :country
      t.integer :average_rating
      t.boolean :wifi
      t.boolean :dishwasher
      t.boolean :allows_pets
      t.boolean :kitchen
      t.integer :guests
      t.boolean :handicap
      t.boolean :balcony
      t.boolean :smoking
      t.boolean :tv
      t.boolean :availability
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
