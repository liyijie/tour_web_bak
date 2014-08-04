class RenameTypeToStyleInTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.rename :type, :style
    end
  end
end
