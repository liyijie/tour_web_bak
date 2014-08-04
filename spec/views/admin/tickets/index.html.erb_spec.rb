require 'rails_helper'

RSpec.describe "admin/tickets/index", :type => :view do
  before(:each) do
    assign(:admin_tickets, [
      Admin::Ticket.create!(),
      Admin::Ticket.create!()
    ])
  end

  it "renders a list of admin/tickets" do
    render
  end
end
