# == Schema Information
#
# Table name: entries
#
#  id          :bigint           not null, primary key
#  address     :string           not null
#  description :text             not null
#  image_url   :string           not null
#  latitude    :float            not null
#  longitude   :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_entries_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Entry < ApplicationRecord
  belongs_to :user
  validates :image_url, :address, :latitude, :longitude, :description, presence: true
end
