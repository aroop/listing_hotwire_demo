class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_user

  def current_user
    User.first
  end

end
