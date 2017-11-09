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

class ChargeSession < ApplicationRecord
  belongs_to :action
  belongs_to :booking
end
