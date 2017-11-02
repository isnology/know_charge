# == Schema Information
#
# Table name: adapter_plugs
#
#  id                :integer          not null, primary key
#  adapter_id        :integer
#  charge_station_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class AdapterPlug < ApplicationRecord
  belongs_to :adapter
  belongs_to :charge_station
end
