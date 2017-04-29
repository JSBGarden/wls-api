class AddCountryToLandslide < ActiveRecord::Migration[5.0]
  def change
    add_column :landslides, :countrsy, :string
  end
end
