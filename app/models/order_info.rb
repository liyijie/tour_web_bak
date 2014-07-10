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

class OrderInfo < ActiveRecord::Base
  validates_presence_of :name, :tel

  belongs_to :order, polymorphic: true
end
