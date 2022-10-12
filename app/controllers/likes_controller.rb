class LikesController < ApplicationController
  before_action :find_listing

  def create
    return if existing_like

    @like = Like.create!(user: current_user, listing: @listing)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to request.referrer } # fallback for non-turbo clients i.e., when JS is disabled
    end
  end

  def destroy
    return unless (like = existing_like)

    like.destroy!

    respond_to do |format|
      format.turbo_stream { render :create }
      format.html { redirect_to request.referrer } # fallback for non-turbo clients i.e., when JS is disabled
    end
  end

  private

  def find_listing
    @listing = Listing.find(params[:listing_id])
  end

  def existing_like
    current_user.likes.where(listing: @listing).first
  end

end
