class CreateLandslide < ActiveRecord::Migration[5.0]
  def change
    create_table :landslides do |t|
      t.string :hazard_type
      t.integer :injuries
      t.string :landslide_size
      t.string :landslide_type
      t.decimal :latitude
      t.string :location_accuracy
      t.string :location_description
      t.decimal :longitude
      t.string :near
      t.string :nearest_places
      t.string :trigger
      t.string :source_name
    end
  end
end
