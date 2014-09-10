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
#  ticket_id   :integer
#  token       :string(255)
#

class TourOrder < ActiveRecord::Base
  include AASM
  
  belongs_to :user
  has_one :order_info, as: :order, dependent: :destroy
  belongs_to :ticket

  validates_presence_of :ticket
  validates_presence_of :user
  before_create :cal_price

  accepts_nested_attributes_for :order_info

  aasm :column => :state do
    state :in_progress, :initial => true
    state :completed
    state :paid
    state :canceled

    event :complete do
      transitions :from => :paid, :to => :completed
    end

    event :pay do
      transitions :from => :in_progress, :to => :paid
    end

    event :cancel do
      transitions :from => :in_progress, :to => :canceled
    end

    event :refund do
      transitions :from => :paid, :to => :canceled
    end
  end

  def human_state
    I18n.t "order_state.#{state}"
  end

  def cal_price
    self.total_price = ticket.price * number
  end

  # 共 24 位(8 位当前日期 + 9 位纳秒 + 1 位随机数)
  def generate_token
    time = Time.now
    if self.token.blank?
      self.token = time.to_s(:number) + time.nsec.to_s + Random.new.rand(1..9).to_s
    end
  end

end
