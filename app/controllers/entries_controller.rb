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
  
    if @entry.address.present?
      coordinates = Geocoder.coordinates(@entry.address)
      if coordinates
        @entry.latitude, @entry.longitude = coordinates
      else
        flash[:alert] = "Unable to geocode the provided address."
        render :new and return
      end
    end
  
    if @entry.save
      redirect_to entries_path, notice: "Entry created successfully!"
    else
      flash[:alert] = "Failed to create entry!"
      render :new
    end
  end
  

  private

  def entry_params
    params.require(:entry).permit(:image_url, :address, :latitude, :longitude, :description)
  end
end

def json_index
  @entries = Entry.all
  render json: @entries.as_json(only: [:id, :latitude, :longitude, :description, :image_url, :address])
end
