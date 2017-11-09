# == Schema Information
#
# Table name: payments
#
#  id                :integer          not null, primary key
#  price_cents       :integer
#  charge_identifier :string
#  booking_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Payment < ApplicationRecord
  belongs_to :booking
end
