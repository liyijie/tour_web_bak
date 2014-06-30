class CreateOrderInfos < ActiveRecord::Migration
  def change
    create_table :order_infos do |t|
      t.string :name
      t.string :tel
      t.string :email

      t.timestamps
    end
  end
end
