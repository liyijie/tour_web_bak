require 'rails_helper'

RSpec.describe "admin/tickets/show", :type => :view do
  before(:each) do
    @admin_ticket = assign(:admin_ticket, Admin::Ticket.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
