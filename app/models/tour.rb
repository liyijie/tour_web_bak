class Tour < ActiveRecord::Base
  has_many :tickets
  has_many :images, as: :imageable

  accepts_nested_attributes_for :tickets, :allow_destroy => true
  accepts_nested_attributes_for :images, :allow_destroy => true

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
