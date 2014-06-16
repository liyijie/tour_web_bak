class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :type
      t.string :title
      t.text :desc
      t.float :price
      t.integer :position

      t.timestamps
    end
  end
end
