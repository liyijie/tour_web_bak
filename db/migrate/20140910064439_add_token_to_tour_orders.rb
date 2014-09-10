class AddTokenToTourOrders < ActiveRecord::Migration
  def change
    add_column :tour_orders, :token, :string

    add_index :tour_orders, :token, unique: true
  end
end
