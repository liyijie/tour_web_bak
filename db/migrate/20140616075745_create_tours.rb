class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.string :sub_title
      t.string :addr
      t.float :price
      t.string :work_range
      t.text :hint
      t.text :desc
      t.text :traffic
      t.string :seq
      t.integer :position

      t.timestamps
    end
  end
end
