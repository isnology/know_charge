# == Schema Information
#
# Table name: vehicles
#
#  id                     :integer          not null, primary key
#  licence_plate          :string
#  make                   :string
#  model                  :string
#  colour                 :string
#  charger_kwh            :float
#  drivers_licence_number :string
#  image_data             :text
#  user_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Vehicle < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
  
end
