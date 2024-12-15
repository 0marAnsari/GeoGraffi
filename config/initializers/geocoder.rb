Geocoder.configure(
  api_key: ENV['GOOGLE_MAPS_API_KEY'], # Store the API key in your .env file
  timeout: 5,                         # Set timeout for API requests
  units: :km                          # Use kilometers (default is miles)
)
