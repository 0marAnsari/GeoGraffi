class Entry < ApplicationRecord
  belongs_to :user
  validates :image_url, :address, :latitude, :longitude, :description, presence: true
end
class Entry < ApplicationRecord
  belongs_to :user
  validates :address, :image_url, :latitude, :longitude, :description, presence: true
end
