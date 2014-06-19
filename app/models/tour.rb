class Tour < ActiveRecord::Base
  has_many :tickets
  has_many :images, as: :imageable

  accepts_nested_attributes_for :tickets

  def image_thumb
    
  end
end
