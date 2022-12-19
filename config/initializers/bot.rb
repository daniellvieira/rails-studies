require 'discordrb'

# rubocop:disable Style/NumericLiterals
ChannelID = 1054451314467291166

Bot = Discordrb::Commands::CommandBot.new(
  token: Rails.application.credentials.dig(:discord, :token),
  client_id: Rails.application.credentials.dig(:discord, :client_id),
  prefix: '/'
)
Dir["#{Rails.root}/app/commands/*.rb"].each { |file| require file }
Bot.run(true)

puts "Invite URL: #{Bot.invite_url}"