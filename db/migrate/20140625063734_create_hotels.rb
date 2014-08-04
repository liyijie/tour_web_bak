class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :addr
      t.string :tel
      t.text :desc
      t.text :traffic

      t.timestamps
    end
  end
end
