class CreateTourOrders < ActiveRecord::Migration
  def change
    create_table :tour_orders do |t|
      t.float :total_price
      t.integer :number
      t.string :state
      t.references :user, index: true

      t.timestamps
    end
  end
end
