class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user, optional: true
  belongs_to :bar, optional: true
end
