class AddFatalityToLandslides < ActiveRecord::Migration[5.0]
  def change
    add_column :landslides, :fatalities, :integer
  end
end
