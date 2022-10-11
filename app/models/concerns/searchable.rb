module Searchable
  extend ActiveSupport::Concern

  included do
    scope :with_city, ->(city) {
      where("lower(city) LIKE ?", "%#{city.downcase}%") if city.present?
    }

    scope :with_state, ->(state_code) {
      state = US_STATES[state_code&.to_sym]
      where("lower(state) LIKE ?", "%#{state.downcase}%") if state.present?
    }

    scope :with_bedrooms, ->(bedrooms) {
      where("bedrooms = ?", bedrooms) if bedrooms.present?
    }

    scope :with_bathrooms, ->(bathrooms) {
      where("bathrooms = ?", bathrooms) if bathrooms.present?
    }
  end

  class_methods do
    def search(params={})
      sort_column =
        params[:sort]
          .presence_in(%w{ by_state by_bedrooms by_price by_bathrooms }) || "by_id"

      sort_direction =
        sort_column == "by_state" ? :asc : :desc

      self
        .with_city(params[:city])
        .with_state(params[:state])
        .with_bedrooms(params[:bedrooms])
        .with_bathrooms(params[:bathrooms])
        .order(sort_column.delete("by_") => sort_direction)
    end
  end

end
