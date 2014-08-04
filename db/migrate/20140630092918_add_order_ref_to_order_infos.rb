class AddOrderRefToOrderInfos < ActiveRecord::Migration
  def change
    add_reference :order_infos, :order, polymorphic: true, index: true
  end
end
