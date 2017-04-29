class AddReferenceUserToLandslides < ActiveRecord::Migration[5.0]
  def change
    add_reference :landslides, :user
  end
end
