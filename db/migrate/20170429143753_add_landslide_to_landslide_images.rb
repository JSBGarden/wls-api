class AddLandslideToLandslideImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :landslide_images, :landslide, foreign_key: true
  end
end
