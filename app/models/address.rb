# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  number     :string
#  street     :string
#  city       :string
#  state      :string
#  postcode   :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ApplicationRecord
  has_one :profile
  has_one :charge_station

  geocoded_by :full_address
  after_validation :geocode #if: ->(obj){ obj.full_address.present? and obj.full_address_changed? }

  def address
    "#{number} #{street} #{city}, #{state} #{postcode}"
  end

  def full_address
    "#{number} #{street} #{city}, #{state} #{postcode}, #{country}"
  end

  def small_address
    "#{number} #{street} #{city}"
  end
end
