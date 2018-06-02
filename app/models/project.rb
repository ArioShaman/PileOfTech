class Project < ApplicationRecord
  has_many :images
  mount_uploader :image, ImageUploader
end
