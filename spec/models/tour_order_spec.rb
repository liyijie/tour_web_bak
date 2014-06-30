# == Schema Information
#
# Table name: tour_orders
#
#  id          :integer          not null, primary key
#  total_price :float
#  number      :integer
#  state       :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe TourOrder, :type => :model do
  context "Relations" do
    it { should belong_to(:user) } 
    it { should have_one(:order_info) } 

  end
end
