$LOAD_PATH << '.'
require 'instasent'

client = Instasent::Client.new('my-token')
response = client.get_sms(1, 50)

puts response['response_body']
puts response['response_code']