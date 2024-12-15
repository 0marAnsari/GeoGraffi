class HomeController < ApplicationController
  def index
    if logged_in?
      @entries = current_user.entries
    else
      @entries = Entry.all # Show all entries if the user is not logged in (optional)
    end

    @graffiti_markers = @entries.select(:latitude, :longitude, :description, :address, :image_url).map do |entry|
      {
        lat: entry.latitude,
        lng: entry.longitude,
        description: entry.description,
        address: entry.address,
        image_url: entry.image_url
      }
    end

    Rails.logger.info "Graffiti Markers: #{@graffiti_markers}"
  end
end
