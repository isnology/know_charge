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
  
  START_CHARGE = 1
  END_CHARGE = 2

  def self.set_times(booking)
    sessions = ChargeSession.where(booking: booking).order(:time)
    # cater for crashes - incomplete records
    start_time = end_time = nil
    sessions.each do |session|
      start_time = session.time if !start_time && session.time.present? && session.action_id == START_CHARGE
      end_time = session.time if session.time.present? && session.action_id == END_CHARGE
    end
    [start_time, end_time]
  end
end
