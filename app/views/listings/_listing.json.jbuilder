json.extract! listing, :id, :street_address, :city, :state, :bathrooms, :bedrooms, :sqft, :price, :zipcode, :created_at, :updated_at
json.url listing_url(listing, format: :json)
