require 'rails_helper'

RSpec.describe "admin/tickets/new", :type => :view do
  before(:each) do
    assign(:admin_ticket, Admin::Ticket.new())
  end

  it "renders new admin_ticket form" do
    render

    assert_select "form[action=?][method=?]", admin_tickets_path, "post" do
    end
  end
end
