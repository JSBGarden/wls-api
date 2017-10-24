class AddExternalIdToLandslides < ActiveRecord::Migration[5.0]
  def change
    add_column :landslides, :external_id, :string, null: true
    add_index :landslides, :external_id, unique: true

  end
end
