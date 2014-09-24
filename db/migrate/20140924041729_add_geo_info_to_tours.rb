class AddGeoInfoToTours < ActiveRecord::Migration
  def change
    add_column :tours, :lon, :float
    add_column :tours, :lat, :float
  end
end
