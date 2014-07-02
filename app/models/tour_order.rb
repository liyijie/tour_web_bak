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
  include AASM
  
  belongs_to :user
  has_one :order_info, as: :order

  aasm :column => :state do
    state :in_progress, :initial => true
    state :complete
    state :paid
    state :canceled

    event :complete do
      transitions :from => :in_progress, :to => :complete
    end

    event :pay do
      transitions :from => [:in_progress, :complete], :to => :paid
    end

    event :cancel do
      transitions :from => :paid, :to => :canceled
    end
  end

  def human_state
    I18n.t "order_state.#{state}"
  end
end
