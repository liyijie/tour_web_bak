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

class TourOrder < ActiveRecord::Base
  # extend StateMachine::MacroMethods
  belongs_to :user
  has_one :order_info, as: :order

  state_machine :initial =>  :in_progress do
    state :in_progress
    state :complete
    state :paid
    state :canceled

    event :complete do
      transition :in_progress => :complete
    end

    event :pay do
      transition [:in_progress, :complete] => :paid
    end
  end
end
