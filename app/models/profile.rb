# == Schema Information
#
# Table name: profiles
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  street_number :string
#  street        :string
#  city          :string
#  state         :string
#  image_data    :text
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  postcode      :string
#  latitude      :float
#  longitude     :float
#

class Profile < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user

  geocoded_by :full_address
  after_validation :geocode, #if: ->(obj){ obj.full_address.present? and obj.full_address_changed? }
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def full_address
    "#{street_number} #{street} #{city}, #{state}, Australia"
  end
  
end
