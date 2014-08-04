class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :provice
      t.string :name
      t.text :desc
      t.integer :position

      t.timestamps
    end
  end
end
