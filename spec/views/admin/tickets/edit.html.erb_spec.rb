require 'rails_helper'

RSpec.describe "admin/tickets/edit", :type => :view do
  before(:each) do
    @admin_ticket = assign(:admin_ticket, Admin::Ticket.create!())
  end

  it "renders the edit admin_ticket form" do
    render

    assert_select "form[action=?][method=?]", admin_ticket_path(@admin_ticket), "post" do
    end
  end
end
