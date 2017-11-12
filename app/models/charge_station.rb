# == Schema Information
#
# Table name: charge_stations
#
#  id              :integer          not null, primary key
#  charge_kwh      :float
#  adapter_id      :integer
#  open_time       :time
#  close_time      :time
#  days_of_week    :string
#  price_kwh_cents :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  latitude        :float
#  longitude       :float
#  address_id      :integer
#

class ChargeStation < ApplicationRecord
  belongs_to :adapter
  belongs_to :user
  has_many :adapter_plugs, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :favourites, dependent: :destroy
  belongs_to :address
  accepts_nested_attributes_for :address, allow_destroy: true
  
  monetize :price_kwh_cents
  
end
