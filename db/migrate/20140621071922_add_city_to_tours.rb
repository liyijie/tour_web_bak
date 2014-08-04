class AddCityToTours < ActiveRecord::Migration
  def change
    add_column :tours, :city, :string
  end
end
