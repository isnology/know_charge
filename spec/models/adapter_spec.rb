# == Schema Information
#
# Table name: adapters
#
#  id         :integer          not null, primary key
#  to_plug    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Adapter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
