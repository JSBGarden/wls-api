class Landslide < ActiveRecord::Base
  before_save :set_country
  belongs_to :user

  has_many :landslide_images
  accepts_nested_attributes_for :landslide_images, allow_destroy: true

  # Track latitude and longitude based on address
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  protected
  def set_country
    self.countryname = CS.countries[self.countrycode.to_sym]
  end
end