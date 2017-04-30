class AddCountrycodeToLandslides < ActiveRecord::Migration[5.0]
  def change
    add_column :landslides, :countrycode, :string
  end
end
