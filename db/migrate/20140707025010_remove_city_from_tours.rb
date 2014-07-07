class RemoveCityFromTours < ActiveRecord::Migration
  def change
    remove_column :tours, :city, :string
  end
end
