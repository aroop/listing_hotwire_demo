module PhysicalAddressFormatter
  extend ActiveSupport::Concern

  def has_address?
    !(street_address.blank? && address_2.blank? && city.blank? && state.blank? && zipcode.blank?)
  end

  def city_state_zip
    [city, state, zipcode].reject(&:blank?).join(" ")
  end

  def address_line_1
    [street_address].reject(&:blank?).join(", ")
  end

  def formatted_address
    [street_address, city_state_zip].reject(&:blank?).join(", ")
  end
end
