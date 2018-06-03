class Project < ApplicationRecord
  has_many :images
  mount_uploader :small_cover, ImageUploader
end
