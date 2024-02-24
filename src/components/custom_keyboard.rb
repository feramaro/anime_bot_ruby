require 'telegram/bot'

class CustomKeyboard

  def self.keyboard(buttons)
    Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons)
  end

  def self.button_callback(text, callback_data)
    Telegram::Bot::Types::InlineKeyboardButton.new(text: text, callback_data: callback_data)
  end

  def self.factory_button(text, id, callback_data)
    Telegram::Bot::Types::InlineKeyboardButton.new(text: text, callback_data: "#{callback_data};#{id}")
  end


end
