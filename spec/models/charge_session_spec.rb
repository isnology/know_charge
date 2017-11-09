# == Schema Information
#
# Table name: charge_sessions
#
#  id         :integer          not null, primary key
#  action_id  :integer
#  time       :time
#  booking_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ChargeSession, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
