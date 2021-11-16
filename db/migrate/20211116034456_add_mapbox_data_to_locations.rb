class AddMapboxDataToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :mapbox_id, :string
    add_column :locations, :mapbox_data, :jsonb
  end
end
