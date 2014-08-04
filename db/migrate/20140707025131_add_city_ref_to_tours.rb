class AddCityRefToTours < ActiveRecord::Migration
  def change
    add_reference :tours, :city, index: true
  end
end
