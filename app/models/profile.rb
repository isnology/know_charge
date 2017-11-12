# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  image_data :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float
#  longitude  :float
#  address_id :integer
#

class Profile < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  belongs_to :address
  accepts_nested_attributes_for :address, allow_destroy: true
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
