class AddTimestampsToLandslide < ActiveRecord::Migration[5.0]
  def change
    add_column(:landslides, :created_at, :datetime)
    add_column(:landslides, :updated_at, :datetime)
  end
end
