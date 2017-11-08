# == Schema Information
#
# Table name: bookings
#
#  id                :integer          not null, primary key
#  start_time        :date
#  name              :string
#  price_cents       :integer
#  vehicle_id        :integer
#  charge_station_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Booking, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
