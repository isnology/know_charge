# == Schema Information
#
# Table name: actions
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Action < ApplicationRecord
  has_many :charge_sessions
end
