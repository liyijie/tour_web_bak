class AddFetchUserToOrderInfo < ActiveRecord::Migration
  def change
    add_column :order_infos, :notify_user, :string
    add_column :order_infos, :notify_tel, :string
  end
end
