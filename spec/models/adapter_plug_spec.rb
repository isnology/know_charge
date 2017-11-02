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

require 'rails_helper'

RSpec.describe AdapterPlug, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
