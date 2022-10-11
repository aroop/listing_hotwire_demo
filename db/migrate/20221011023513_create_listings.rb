class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.float :bathrooms
      t.integer :bedrooms
      t.integer :sqft
      t.float :price
      t.string :zipcode

      t.timestamps
    end
  end
end
