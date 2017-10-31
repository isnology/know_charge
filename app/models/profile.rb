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
#

class Profile < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
