class RenameColumnOcuranceAtToTstamp < ActiveRecord::Migration[5.0]
  def change
    rename_column :landslides, :occurance_at, :tstamp
  end
end
