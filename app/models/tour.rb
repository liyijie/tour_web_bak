# == Schema Information
#
# Table name: tours
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  sub_title  :string(255)
#  addr       :string(255)
#  price      :float
#  work_range :string(255)
#  hint       :text
#  desc       :text
#  traffic    :text
#  seq        :string(255)
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#  city_id    :integer
#

class Tour < ActiveRecord::Base
  has_many :tickets
  has_many :images, as: :imageable

  belongs_to :city

  accepts_nested_attributes_for :tickets, :allow_destroy => true
  accepts_nested_attributes_for :images, :allow_destroy => true

  def price
    tickets.minimum(:price)
  end

  def image_thumb
    images.first.photo.url(:medium) if images.first
  end

  def image_large
    images.first.photo.url if images.first
  end

  def relate_tours(num)
    Tour.where(city: city).where.not(id: id).limit(num)
  end
end
