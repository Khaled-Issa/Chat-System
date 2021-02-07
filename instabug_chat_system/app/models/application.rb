class Application < ApplicationRecord
  has_secure_token :application_token
  has_many :chats
  def chats_count
    chats.count
  end
  def chats_with_messages
    chats.map do |chat|
      { number: chat.number,
      messages_count: chat.messages_count,
      messages: chat.messages
    }
    end
  end
  # validations
  # validates_presence_of :chat_count
end
