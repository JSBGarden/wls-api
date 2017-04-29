class LandslideImage < ApplicationRecord
  mount_uploader :image, LandslideImageUploader
  belongs_to :landslide
end