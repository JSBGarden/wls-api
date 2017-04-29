class AddOccuranceAtToLandslide < ActiveRecord::Migration[5.0]
  def change
    add_column :landslides, :occurance_at, :datetime

  end
end
