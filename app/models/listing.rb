class Listing < ApplicationRecord
  include PhysicalAddressFormatter
  include Searchable

  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [450, 450]
  end

  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user: user).exists?
  end

end
