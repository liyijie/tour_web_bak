class AddCityToHotels < ActiveRecord::Migration
  def change
    add_reference :hotels, :city, index: true
  end
end
