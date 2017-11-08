# == Schema Information
#
# Table name: conversations
#
#  id                :integer          not null, primary key
#  charge_station_id :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Conversation < ApplicationRecord
  belongs_to :charge_station
  belongs_to :user
  has_many :messages, dependent: :destroy
  
end
