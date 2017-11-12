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

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
