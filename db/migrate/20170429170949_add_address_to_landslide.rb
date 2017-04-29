class AddAddressToLandslide < ActiveRecord::Migration[5.0]
  def change
    add_column :landslides, :address, :string
  end
end
