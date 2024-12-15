class EntriesController < ApplicationController
  before_action :require_login

  def index
    @entries = current_user.entries
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
  
    # Geocode the address
    if @entry.address.present?
      coordinates = Geocoder.coordinates(@entry.address)
      if coordinates
        @entry.latitude, @entry.longitude = coordinates
      else
        flash[:alert] = "Unable to geocode the address."
        render :new and return
      end
    end
  
    # Save the entry
    if @entry.save
      redirect_to entries_path, notice: "Graffiti entry created successfully!"
    else
      flash[:alert] = "Failed to create entry. Please check the form and try again."
      render :new
    end
  end
  
  private
  
  def entry_params
    params.require(:entry).permit(:image_url, :address, :description)
  end
  
end

def json_index
  @entries = Entry.all
  render json: @entries.as_json(only: [:id, :latitude, :longitude, :description, :image_url, :address])
end
