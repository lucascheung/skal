class Bar < ApplicationRecord
  has_one :match
  has_many :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
