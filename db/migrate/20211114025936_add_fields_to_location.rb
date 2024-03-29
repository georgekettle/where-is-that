class AddFieldsToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :city, :string
    add_column :locations, :postal_code, :string
    add_column :locations, :state, :string
    add_column :locations, :state_code, :string
    add_column :locations, :country, :string
    add_column :locations, :country_code, :string
    add_column :locations, :name, :string
  end
end
