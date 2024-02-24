class TesteHandler

  def initialize(bot)
    @bot = bot
  end

  def handle(message, id)
    @bot.api.send_message(chat_id: message.from.id, text: "Callback teste com id informado #{id}")

  end
end
