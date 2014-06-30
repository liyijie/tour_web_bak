# == Schema Information
#
# Table name: order_infos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  tel        :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class OrderInfo < ActiveRecord::Base
end
