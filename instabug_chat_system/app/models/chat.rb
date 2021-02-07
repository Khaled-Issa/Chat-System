class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages
  before_create :set_chat_number
  def messages_count
    messages.count
  end
  def set_chat_number
    self.number =  application.chats.count + 1
  end
end
