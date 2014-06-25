class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.float :price
      t.text :desc

      t.timestamps
    end
  end
end
