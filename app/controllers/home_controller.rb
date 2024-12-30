class HomeController < ApplicationController
  before_action :require_login, only: [:index] # Enforce login for the homepage

  def index
    # Only fetch current_user entries if logged in
    @entries = current_user.entries if logged_in?

    @graffiti_markers = @entries.select(:latitude, :longitude, :description, :address, :image_url, :name).map do |entry|
      {
        lat: entry.latitude,
        lng: entry.longitude,
        description: entry.description,
        address: entry.address,
        image_url: entry.image_url,
        name: entry.name
      }
    end

    Rails.logger.info "Graffiti Markers: #{@graffiti_markers}"
  end
end
