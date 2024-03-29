# == Schema Information
#
# Table name: order_infos
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  tel         :string(255)
#  email       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  order_id    :integer
#  order_type  :string(255)
#  notify_user :string(255)
#  notify_tel  :string(255)
#

require 'rails_helper'

describe OrderInfo do
  context "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:tel) }
    it { should validate_presence_of(:notify_tel) }
    it { should validate_presence_of(:notify_user) }
  end

  context "Relations" do
    it { should belong_to(:order) } 
  end
end
