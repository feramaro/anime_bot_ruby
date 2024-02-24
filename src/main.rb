require_relative "components/custom_keyboard"
require_relative "callback_handlers/teste_handler"
require_relative "errors/handler_not_implemented_error"
require_relative "api/kitsu_client"
require_relative "dto/anime_dto"

token = ENV["TELEGRAM_BOT_KEY"]
bot = Telegram::Bot::Client.new(token)

Signal.trap("INT") do
  bot.stop
end

handlers = { :anime_info => TesteHandler.new(bot) }

puts "Bot Rodando"
buttons = [[CustomKeyboard.button_callback("Teste", "teste"),
            CustomKeyboard.button_callback("Teste2", "teste2")]]
bot.listen do |message|
  case message
  when Telegram::Bot::Types::CallbackQuery
    begin
      callback = message.data.split(";")
      puts callback
      handler = handlers[callback[0].to_sym]
      if handler == nil
         raise HandlerNotImplementedError.new
      end

      handler.handle(message, callback[1])
    rescue StandardError => e
      puts e
      bot.api.send_message(chat_id: message.from.id, text: "Erro ao processar mensagem, contate o desenvolvedor!")
    end
  when Telegram::Bot::Types::Message
    messageSplit = message.text.split(":")
    if message.text == "trending"
      puts "Requisição recebida"
      kitsu = KitsuClient.new
      trending_animes = kitsu.get_trending
      trending_animes.each do |anime|
        buttons = [[CustomKeyboard.factory_button("Mais informações", anime.id, "anime_info")]]
        bot.api.send_photo(chat_id: message.chat.id, photo: anime.poster)
        bot.api.send_message(chat_id: message.chat.id, text: anime.description, reply_markup: CustomKeyboard.keyboard(buttons))
      end
    end

  end
end
