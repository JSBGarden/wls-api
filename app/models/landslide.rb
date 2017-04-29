class Landslide < ActiveRecord::Base
  belongs_to :user

  has_many :landslide_images
  accepts_nested_attributes_for :landslide_images, allow_destroy: true
end