class LikesController < ApplicationController
  before_action :find_listing

  def create
    return if existing_like

    @like = Like.create!(user: current_user, listing: @listing)
    redirect_to request.referrer
  end

  def destroy
    return unless (like = existing_like)

    like.destroy!
    redirect_to request.referrer
  end

  private

  def find_listing
    @listing = Listing.find(params[:listing_id])
  end

  def existing_like
    current_user.likes.where(listing: @listing).first
  end

end
