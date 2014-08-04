class AddTourIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :tour_id, :integer
  end
end
