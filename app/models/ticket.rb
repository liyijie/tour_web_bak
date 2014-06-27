# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  style      :string(255)
#  title      :string(255)
#  desc       :text
#  price      :float
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#  tour_id    :integer
#

class Ticket < ActiveRecord::Base
  belongs_to :tour
end
