# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  content         :text
#  read            :boolean
#  conversation_id :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  scope :for_display, -> (conversation) { where(conversation: conversation).order(:created_at).last(50) }
  scope :un_read, -> (conversation, user) { where(conversation: conversation).where.not(user_id: user.id).
    where.not(read: true) }
  
  def self.find_my_id(user, conversation)
    user.id == conversation.user_id ? 'a' : 'b'
  end
end
