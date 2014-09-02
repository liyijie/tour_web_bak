class AddLevelToTours < ActiveRecord::Migration
  def change
    add_column :tours, :level, :integer
  end
end
