class EntriesController < ApplicationController
  before_action :require_login

  # List all entries for the current user
  def index
    @entries = current_user.entries
  end

  # Display form for new entry
  def new
    @entry = Entry.new
  end

  # Create a new entry
  def create
    @entry = current_user.entries.new(entry_params)

    Rails.logger.debug("Entry Params: #{entry_params.inspect}")
    Rails.logger.debug("New Entry: #{@entry.inspect}")

    # Geocode the address if provided
    if @entry.address.present?
      coordinates = Geocoder.coordinates(@entry.address)
      if coordinates
        @entry.latitude, @entry.longitude = coordinates
      else
        flash[:alert] = "Unable to geocode the address. Please try again."
        render :new and return
      end
    end

    if @entry.save
      Rails.logger.debug("Entry Saved: #{@entry.inspect}")
      redirect_to entries_path, notice: "Graffiti entry created successfully!"
    else
      Rails.logger.debug("Validation Errors: #{@entry.errors.full_messages}")
      flash[:alert] = "Failed to create entry. Please check the form and try again."
      render :new
    end
  end

  # Display form to edit an existing entry
  def edit
    @entry = current_user.entries.find(params[:id])
  end

  # Update an existing entry
  def update
    @entry = current_user.entries.find(params[:id])

    if @entry.update(entry_params)
      redirect_to entries_path, notice: "Graffiti entry updated successfully!"
    else
      Rails.logger.debug("Update Errors: #{@entry.errors.full_messages}")
      flash[:alert] = "Failed to update graffiti entry. Please check the form."
      render :edit
    end
  end

  # Delete an entry
  def destroy
    @entry = current_user.entries.find(params[:id])

    if @entry.destroy
      redirect_to entries_path, notice: "Graffiti entry deleted successfully!"
    else
      redirect_to entries_path, alert: "Failed to delete the graffiti entry."
    end
  end

  # Provide JSON data for all entries (used by the map)
  def json_index
    @entries = Entry.all
    render json: @entries.as_json(only: [:id, :latitude, :longitude, :description, :image_url, :address, :name])
  end

  private

  # Strong parameters for entry
  def entry_params
    params.require(:entry).permit(:image_url, :address, :description, :name)
  end
end
