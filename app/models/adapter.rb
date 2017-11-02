# == Schema Information
#
# Table name: adapters
#
#  id         :integer          not null, primary key
#  to_plug    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Adapter < ApplicationRecord
  has_many :adapter_plugs
  has_one :charge_station
end
