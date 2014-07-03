class AddTicketToTourOrder < ActiveRecord::Migration
  def change
    add_reference :tour_orders, :ticket, index: true
  end
end
